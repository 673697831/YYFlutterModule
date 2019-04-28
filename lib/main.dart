import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/ui/setting/setting.dart';
import 'package:flutter_module/ui/mywallet/my_wallet.dart';
import 'package:flutter_module/ui/mywallet/recharge_help.dart';
import 'package:flutter_module/ui/mywallet/hz_amount.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    FlutterBoost.singleton.registerPageBuilders({
      'setting': (pageName, params, _) => SettingPage(),
      'my_wallet': (pageName, params, _) => MyWallet(),
      'recharge_help': (pageName, params, _) => RechargeHelp(),
      'hz_amount': (pageName, params, _) => HZAmount(),
    });

    FlutterBoost.handleOnStartPage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(builder: FlutterBoost.init(), home: Container());
  }
}
