# YYFlutterModule

[![CI Status](https://img.shields.io/travis/673697831/YYFlutterModule.svg?style=flat)](https://travis-ci.org/673697831/YYFlutterModule)
[![Version](https://img.shields.io/cocoapods/v/YYFlutterModule.svg?style=flat)](https://cocoapods.org/pods/YYFlutterModule)
[![License](https://img.shields.io/cocoapods/l/YYFlutterModule.svg?style=flat)](https://cocoapods.org/pods/YYFlutterModule)
[![Platform](https://img.shields.io/cocoapods/p/YYFlutterModule.svg?style=flat)](https://cocoapods.org/pods/YYFlutterModule)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

YYFlutterModule is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'YYFlutterModule'
```

## Author

673697831, ouzhirui@yy.com

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

## 编译过程中如果出现问题

- `cocoapods` 版本使用 `1.5.3`
- 仅保留 `.git`、 `.gitignore`、 `flutter_wrapper.properties` 、 `flutterw`、 `lib`、 `images`、 `pubspec.yaml`、 `flutterw`、 `supportFiles` , 删除其他文件再编译

## 未解决问题

- 使用脚本 `./flutterw.sh build ios --release --no-codesign` 无法编译成功
