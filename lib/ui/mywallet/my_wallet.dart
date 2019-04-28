import 'package:flutter/material.dart';
import 'package:flutter_module/plugins/core/notification.dart';
import 'package:flutter_module/plugins/core/utils.dart';
import 'package:flutter_boost/flutter_boost.dart';

class MyWallet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  String balance = '正在查询';
  String hzAmount = '正在查询';

  @override
  void initState() {
    super.initState();
    queryMyWallet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '我的钱包',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 18,
              color: Colors.black,
            ),
            onPressed: _onBack,
          ),
          actions: <Widget>[
            MaterialButton(
              child: Text(
                '帮助中心',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              onPressed: _onGoToHelp,
            )
          ],
        ),
        body: Container(
          color: Color.fromARGB(255, 245, 245, 245),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset('assets/images/my_wallet_yicon_bg.png'),
                  Center(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 25, 0, 18),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Y币金额',
                              style: TextStyle(
                                  color: Color(0x80867030),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 24),
                              child: Text(
                                balance,
                                style: TextStyle(
                                    color: Color(0xff1d1d1d),
                                    fontSize: 40,
                                    fontFamily: 'DINAlternate-Bold'),
                              ),
                            ),
                            GestureDetector(
                              onTap: _onGoToWalletDetail,
                              child: Container(
                                margin: const EdgeInsets.only(top: 8),
                                child: Text(
                                  '收支明细  >',
                                  style: TextStyle(
                                      color: Color(0xff867030),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.only(top: 16),
                                width: 160,
                                height: 44,
                                child: RaisedButton(
                                    shape: const RoundedRectangleBorder(
                                        side: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(22))),
                                    child: Text(
                                      '我要充值',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    onPressed: _onGoToRechargeCenter,
                                    color: Color(0xffffdd00),
                                    highlightColor: Color(0x55ffffff),
                                    splashColor: Color(0x55ffffff))),
                          ],
                        )),
                  )
                ],
              ),
              GestureDetector(
                onTap: _onGoToHZAmout,
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                  height: 75,
                  color: Colors.white,
                  child: Row(children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(right: 18),
                      child: Image.asset('assets/images/wallet_red_icon.png',
                          width: 24),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Text('红钻总额')),
                          Text(hzAmount)
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/images/system_list_arrow.png',
                      width: 15,
                    )
                  ]),
                ),
              ),
              GestureDetector(
                onTap: _onGoToPackageRecord,
                child: Container(
                  margin: const EdgeInsets.only(top: 4),
                  padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                  height: 50,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(right: 18),
                        child: Image.asset(
                            'assets/images/wallet_packet_icon.png',
                            width: 24),
                      ),
                      Expanded(
                        child: Text('包裹记录'),
                      ),
                      Image.asset(
                        'assets/images/system_list_arrow.png',
                        width: 15,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  queryMyWallet() {
    yyLogInfo('queryMyWallet');
    NotificationCenter().execute('queryMyWallet');
    NotificationCenter().onNotification.listen((Map map) async {
      yyLogInfo(map.toString());
      String event = map['event'];
      if (event == 'my_wallet_balance') {
        setState(() {
          if (map['balance'] == 0) {
            balance = '0';
          } else {
            balance = map['balance'].toString();
          }
        });
      } else if (event == 'my_wallet_hz_amount') {
        setState(() {
          if (map['hzAmount'] == 0) {
            hzAmount = '0';
          } else {
            hzAmount = map['hzAmount'].toString();
          }
        });
      }
    });
  }

  _onGoToWalletDetail() {
    yyGoToWeb('https://web.yy.com/wallet/index.html#/yb_detail');
  }

  _onGoToHelp() {
    yyGoToWeb('https://web.yy.com/wallet/help.html');
  }

  _onBack() {
    FlutterBoost.singleton.closePageForContext(context);
  }

  _onGoToPackageRecord() {
    yyPushViewController('YYPackageRecordViewController');
  }

  _onGoToRechargeCenter() {
    yyGoTo('yymobile://Common/RechargeCenter');
  }

  _onGoToHZAmout() {
    yyPushFlutter('hz_amount');
  }
}
