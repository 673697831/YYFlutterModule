function check_flutter() {
    echo "Check Flutter environment"
    local flutter_wrapper="./flutterw"
    if [ -e $flutter_wrapper ]; then
        echo 'flutterw installed' >/dev/null
    else
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/passsy/flutter_wrapper/master/install.sh)"
        if [[ $? -ne 0 ]]; then
            # 上一步脚本执行失败
            echo "Failed to installed flutter_wrapper."
            exit -1
        fi
    fi
    ./flutterw --version
}

function build_ios() {
    packages_get
    copy_supportFiles "$@"
    ./flutterw "$@"
    collect_ios_product "$@"
}

function packages_get() {
    echo "Start get flutter app plugin"
    ./flutterw clean 
    ./flutterw packages get
    if [[ $? -ne 0 ]]; then
        # 上一步脚本执行失败
        echo "Failed to install flutter plugins."
        exit -1
    fi

    echo "Finish get flutter app plugin"
}

function copy_supportFiles() {
    echo "Start copy supportFiles"
    local basePath=$(cd `dirname $0`; pwd)
    if [ -f "${basePath}/.flutter-plugins" ];
    then
        local flutter_plugins="${basePath}/.flutter-plugins"
        while read -r line
        do
            if [[ ! "$line" =~ ^// && ! "$line" =~ ^# ]];
            then
                cp -rf ./supportFiles/Podfile  .ios/
                break
            fi
        done < $flutter_plugins
    else
        echo "无第三方插件，无需复制Podfile"
    fi

    cp -rf ./supportFiles/podhelper.rb .ios/Flutter/
}

#收集iOS编译产物
function collect_ios_product() {
    echo "收集iOS构建产物"
    local basePath=$(cd `dirname $0`; pwd)
    local flutter_plugins="${basePath}/.flutter-plugins"
    local product_dir="${basePath}/outProduct/ios" #产物ios输出目录
    echo $product_dir
    rm -rf "${product_dir}"
    mkdir -p "$product_dir"

    local flutter_build_soures=$basePath/.ios/Flutter
    local product_flutter=$product_dir/flutter 
    rm -rf $product_flutter
    mkdir -p $product_flutter

    local app_framework="${flutter_build_soures}/App.framework"
    local flutter_framework="${flutter_build_soures}/engine/Flutter.framework"
    local plugin_reg="${flutter_build_soures}/FlutterPluginRegistrant"
    local cp_list=($app_framework $flutter_framework $plugin_reg)
    for cp_path in ${cp_list[@]}
    do
        echo "拷贝$cp_path 到 $product_flutter/${cp_path##*/}"
        cp -fr $cp_path $product_flutter/${cp_path##*/}
    done

    local flutterPluginRegistrant_m="${product_flutter}/FlutterPluginRegistrant/Classes/GeneratedPluginRegistrant.m"
    
    local pluginName=()
    #收集插件
    while read -r line
    do
        if [[ ! "$line" =~ ^// && ! "$line" =~ ^# ]]; 
        then
            array=(${line//=/ }) #${str//substring/replacement} 使用$replacement, 代替所有匹配的$substring
            local pluginSourePath="${array[1]}/ios/Classes"
            if [[ -e "$pluginSourePath" ]]; then
                local plugin=$product_dir/plugins/${array[0]}
                rm -rf $plugin
                mkdir -p $plugin
                for source_file in `find "$pluginSourePath" -name "*mm" -o -name "*.[h|m]"`; do
                    cp -f $source_file $plugin
                    sed -i '' "s/${array[0]}\///g" "${plugin}/${source_file##*/}"
                done

                #去掉#import <plugin/plugin.h> 的plugin/库名，#import <plugin.h>
                sed -i '' "s/${array[0]}\///g" "${flutterPluginRegistrant_m}"
            else
                echo "The plugin ${array[0]} do not exist!"
            fi

            pluginName+=("${array[0]}")

        fi
    done < $flutter_plugins

    #搜集pod依赖
    local dependencyPod=()
    #收集依赖
    while read -r line
    do
        if [[ ! "$line" =~ ^// && ! "$line" =~ ^# ]]; 
        then
            array=(${line//=/ }) 
            local pluginPodspecPath="${array[1]}/ios/${array[0]}.podspec"
            while read -r podline
            do
                if [[ "$podline" =~ s.dependency && ! "$podline" == "s.dependency 'Flutter'" ]];
                then
                    #过滤依赖插件（本地podspec）
                    for name in ${pluginName[@]}
                    do
                        if [[ $podline =~ $name ]]; 
                        then
                            echo "该依赖为插件本地pod："${podline}
                            continue 2 #跳过外层的循环
                        fi
                    done

                    echo "发现有效依赖："$podline

                    # dependencyPod=$dependencyPod"\\n"$podline
                    dependencyPod+=("$podline")
                fi
            done < $pluginPodspecPath
        fi
    done < $flutter_plugins

    local dependencyText=$(printf '%s\\n' "${dependencyPod[@]}")
    echo "插件依赖列表""${dependencyText}"

    local supportPodSpec="${basePath}/supportFiles/FlutterApi.podspec"

    local podspecfile=`cat $supportPodSpec`
    local podfinl=${podspecfile//<dependency>/$dependencyText}
    #echo "$podfinl" > "${product_dir}/FlutterApi.podspec"
    echo "$podfinl" > "${basePath}/FlutterApi.podspec"
} 


#check_flutter

case "$1","$2" in
"build","ios")
    build_ios "$@" 
    ;;
*)
    ./flutterw "$@" 
    ;;
esac
