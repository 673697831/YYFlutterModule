import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/plugins/core/authCore.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() {
    return _SettingPageState();
  }
}

class _SettingPageState extends State<SettingPage> {
  // 渲染前的操作，类似viewDidLoad

  var _uid = 0;
  @override
  void initState() {
    super.initState();
    createListItems();
  }

  Future<void> createListItems() async {
    int uid = await AuthCore().getUserId();
    setState(() {
      _uid = uid;
    });

    AuthCore().onUserIdChange.listen((int newUserId) async {
      setState(() {
        _uid = newUserId;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      minimum: EdgeInsets.only(top: 64),
      child: new Text('用户uid:${_uid}'),
    ));
  }
}
