import 'package:flutter/material.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:flutter_module/plugins/core/utils.dart';

class RechargeHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '帮助',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            FlutterBoost.singleton.closePageForContext(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 18, color: Colors.black),
        ),
        actions: <Widget>[
          MaterialButton(
            onPressed: _onGoToRechargeRecord,
            child: Text(
              '充值记录',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.fromLTRB(12, 8, 0, 0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            '关于AppStore充值',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(12, 8, 0, 0),
                          width: 375,
                          height: 0.5,
                          color: Colors.grey,
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(12, 8, 12, 30),
                          child: Text(
                            'iOS版APP仅支持APP Store充值，单笔最高可充518元，具体操作步骤：打开APP-个人中心-充值中心',
                            style: TextStyle(fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.only(left: 12),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(
                            '充值相关问题',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          width: 375,
                          height: 0.5,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                        ),
                        Text(
                          '什么是Y币？',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 8, 12, 0),
                          child: Text('Y币是多玩充值平台的中间货币，	可以自由转换成平台下各产品的消费货币。',
                              style: TextStyle(fontSize: 15)),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.fromLTRB(0, 30, 12, 0),
                          child: Text(
                            '如何查询我的充值记录？',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 8, 12, 0),
                          child: Text(
                              '首先请确认账号是否正确，如果账号核实无误后，你可先点击“个人中心”，并在右上角点击“意见反馈”，提交您的遇到的问题。',
                              style: TextStyle(fontSize: 15)),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsets.fromLTRB(0, 30, 12, 0),
                          child: Text(
                            '充值没有到账怎么办？',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 8, 12, 8),
                          child: Text(
                              'iOS版APP仅支持APP Store充值，单笔最高可充518元，具体操作步骤：打开APP-个人中心-充值中心',
                              style: TextStyle(fontSize: 15)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onGoToRechargeRecord() {
    yyPushViewController('YYRechargeAssistantViewController');
  }
}
