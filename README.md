# YYFlutterModule

[![CI Status](https://img.shields.io/travis/673697831/YYFlutterModule.svg?style=flat)](https://travis-ci.org/673697831/YYFlutterModule)
[![Version](https://img.shields.io/cocoapods/v/YYFlutterModule.svg?style=flat)](https://cocoapods.org/pods/YYFlutterModule)
[![License](https://img.shields.io/cocoapods/l/YYFlutterModule.svg?style=flat)](https://cocoapods.org/pods/YYFlutterModule)
[![Platform](https://img.shields.io/cocoapods/p/YYFlutterModule.svg?style=flat)](https://cocoapods.org/pods/YYFlutterModule)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

放到与工程目录下同一级别，构建完后跑 `runner` 看效果

```ruby
./flutterw.sh build ios --release --no-codesign
```

## Author

ozr, ouzhirui@yy.com

## License

YYFlutterModule is available under the MIT license. See the LICENSE file for more info.

## 快速搭建

```ruby
flutter create -t module flutter_module
```

- 为了解决各个开发者使用的 flutter sdk 版本不一致问题，我们用到 `flutter_wrapper` 工具

```ruby
cd flutter_module
```

```ruby
curl -O https://raw.githubusercontent.com/zakiso/flutterw/master/flutterw && chmod 755 flutterw
```

```ruby
./flutterw init
```

- `flutter_wrapper.properties` 文件可以编辑，编辑其中的 `VERSION` 字段选择正确的 sdk 版本
- 记得将 `flutterw` 文件和 `flutter_wrapper.properties` 文件添加到 git 中提交到仓库里
- 其他成员拉取代码后在项目中使用 `flutter` 命令的地方使用 `./flutterw` 代替

* 参考 https://mp.weixin.qq.com/s/QoevlX6pUecbX56nCDEgCA

```ruby
./flutterw build ios --release --no-codesign
```

- 为了解决在手 y 上远程依赖问题，使用 `flutterw.sh` 脚本代替 `flutterw`, 此脚本每次执行时会收集产物

```ruby
./flutterw.sh build ios --release --no-codesign
```

- 如果使用 IDE 编写程序，如 VSCode，需要把 SDK 设置改为 `flutter_wrapper` 目录下的 `flutter` ，VSCode 的设置如下 `Preferences` -> `Settings` -> 搜索 `flutterpath`

## 热重载

- 在工程目录下, 启动调试 （7D5DA769-4B93-4E32-87CB-4891501D2DA1 是你的 iOS 设备）

```ruby
./flutterw.sh attach -d 7D5DA769-4B93-4E32-87CB-4891501D2DA1
```

- 打开 yymoblie 项目工程，编译并运行，进入 `flutter` 页面
- 修改 dart 文件，在刚才的启动的命令行输入 `r` 或 `R` 就能更新

## 混编断点调试

### vscode

<img src="https://github.com/673697831/YYFlutterModule/blob/master/document/add_configurations_5.png?raw=true" alt="419 * 596" 
  align=center>

- 添加配置 `Debug -> Add Configuration`

  <img src="https://github.com/673697831/YYFlutterModule/blob/master/document/add_configurations_0.png?raw=true" alt="719 * 400" 
  align=center>

* 选择设备

  <img src="https://github.com/673697831/YYFlutterModule/blob/master/document/add_configurations_4.png?raw=true" alt="891 * 129"
  align=center>

- 开始连接模拟器 `Debug -> Start Debugging`
- 寻找 iOS 设备上 `Observatory` 端口, 以下是启动 `xcode` `Debug` 模式下查看得到

  <img src="https://github.com/673697831/YYFlutterModule/blob/master/document/add_configurations_1.png?raw=true" alt="603 * 76" 
  align=center>

* 在 `Configuration` 中添加端口号 `port`

  <img src="https://github.com/673697831/YYFlutterModule/blob/master/document/add_configurations_2.png?raw=true" alt="769 * 326" 
  align=center>

* 重新加载文件 `hot reload`

  <img src="https://github.com/673697831/YYFlutterModule/blob/master/document/add_configurations_3.png?raw=true" alt="621 * 348" 
  align=center>

* vscode 目前不支持更多的调试栏按钮, 没有 `hot restart`, 你需要绑定一个快捷键, 编辑 `keybindings`， `Code -> Preferences -> Keyboard Shortcuts`

### Android Studio

- Google 官方 IDE 更为牛逼，安装 `Flutter` 插件, 打开 `Flutter` 工程
- 添加 `Configuration`， `Run -> Edit Configurations -> + Dart Remote Debug -> 修改Port`
- 看到 `Connented` 提示即可

  <img src="https://github.com/673697831/YYFlutterModule/blob/master/document/Dart%20Remote%20Debug%201.png?raw=true" alt="947 * 630" 
  align=center>

  <img src="https://github.com/673697831/YYFlutterModule/blob/master/document/Dart%20Remote%20Debug%202.png?raw=true" alt="968 * 651" 
  align=center>

* 参考文档 https://juejin.im/entry/5b69272051882569fd2893da

## 编译过程中如果出现问题

- `cocoapods` 版本使用 `1.5.3`
- 仅保留 `.git`、 `.gitignore`、 `flutter_wrapper.properties` 、 `flutterw`、 `lib`、 `images`、 `pubspec.yaml`、 `flutterw`、 `supportFiles` , 删除其他文件再编译

## SDK 支持

如果要构建外发 `Release` 包，即只有真机架构而且不能调试的集成产物

```ruby
./flutterw.sh build ios --release --no-codesign
```

如果要构建外发 `Debug` 包， 即包含模拟器架构且可以热重载调试

```ruby
./flutterw.sh build ios --debug --simulator --no-codesign
```

## 接下来要做的事情

- `post_install` podfile 中多个钩子冲突问题

- `Flutter` 私有插件制作 (模拟 `flutter_boost` 做一套属于自己的)
