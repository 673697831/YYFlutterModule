import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/plugins/core/utils.dart';

class HZAmount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            FlutterBoost.singleton.closePageForContext(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 18,
          ),
        ),
        title: Text(
          '红钻总额',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          MaterialButton(
            onPressed: _onGoToHelp,
            child: Text(
              '帮助中心',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
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
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 22),
                      ),
                      Text('红钻总额'),
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                      ),
                      Text(
                        '0',
                        style: TextStyle(
                          fontFamily: 'DINAlternate-Bold',
                          fontSize: 40,
                          color: Color(0xff1d1d1d),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: _onGoToExchange,
              child: Container(
                color: Colors.white,
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                height: 50,
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/wallet_red_icon.png',
                      width: 24,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Text('Y币兑换红钻'),
                      ),
                    ),
                    Image.asset(
                      'assets/images/system_list_arrow.png',
                      width: 15,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: _onGoToActHZ,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                height: 50,
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/wallet_red_icon.png',
                      width: 24,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Text('活动红钻'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 4),
                      child: Text('0'),
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
      ),
    );
  }

  _onGoToHelp() {
    yyGoToWeb('https://web.yy.com/wallet/help.html');
  }

  _onGoToExchange() {
    yyGoToWeb('https://web.yy.com/wallet/y2red.html');
  }

  _onGoToActHZ() {
    yyPushViewController('YYStoreRedDiamondViewController');
  }
}
