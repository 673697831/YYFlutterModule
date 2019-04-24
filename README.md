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

## 编译过程中如果出现问题

- `cocoapods` 版本使用 `1.5.3`
- 仅保留 `.git`、 `.gitignore`、 `flutter_wrapper.properties` 、 `flutterw`、 `lib`、 `images`、 `pubspec.yaml`、 `flutterw`、 `supportFiles` , 删除其他文件再编译

## 接下来要做的事情

- 远程依赖集成

* YYFlutterSDK 的制作
