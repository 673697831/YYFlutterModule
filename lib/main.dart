import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/ui/setting/setting.dart';

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
    });

    FlutterBoost.handleOnStartPage();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(builder: FlutterBoost.init(), home: Container());
  }
}
