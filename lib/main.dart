import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

void main() {
  runApp(new MyApp());
}

/**
 * 垂直listView
 */
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final title = 'list';
//     return new MaterialApp(
//       title: title,
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: new Text(title),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: <Widget>[
//             Container(
//               height: 100,
//               color: Colors.red,
//               child: ListView(
//                 //控制方向 默认是垂直的
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.all(16.0),
//                 children: <Widget>[
//                   _getContainer('Maps', Icons.map),
//                   _getContainer('phone', Icons.phone),
//                   _getContainer('Maps', Icons.map),
//                   _getContainer('Maps', Icons.map),
//                   _getContainer('phone', Icons.phone),
//                   _getContainer('Maps', Icons.map),
//                   _getContainer('Maps', Icons.map),
//                   _getContainer('phone', Icons.phone),
//                   _getContainer('Maps', Icons.map),
//                   _getContainer('Maps', Icons.map),
//                   _getContainer('Maps', Icons.map),
//                   _getContainer('phone', Icons.phone),
//                   _getContainer('Maps', Icons.map),
//                 ],
//               ),
//             ),
//             Text(
//               'You have pushed the button this many times:',
//             ),
//           ],
//         ),
//       ),
//     );
//   }

/**
   * 抽取item项
   */
//   Widget _getContainer(String test, IconData icon) {
//     return new Container(
//       height: 60.0,
//       color: Colors.red,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Image(image: new AssetImage('images/ic_assignment_ind_36pt.png')),
//           Text(
//             'abc',
//           ),
//         ],
//       ),
//     );
//   }
// }

class BasicMenuItem {
  String name;
  Image image;
  String callbackname;
  BasicMenuItem(this.name, this.image, this.callbackname);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page 4'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 注册一个通知
  static const EventChannel eventChannel =
      const EventChannel('com.pages.your/native_post');

  var list = <Map>[];
  var functionItems = <BasicMenuItem>[];

  // 渲染前的操作，类似viewDidLoad
  @override
  void initState() {
    super.initState();

    // 监听事件，同时发送参数12345
    eventChannel
        .receiveBroadcastStream('init')
        .listen(_onEvent, onError: _onError);

    var nameList = [
      '清屏',
      '高清',
      '举报',
      '管理',
      '互动',
      '直播间管理',
      '音频模式',
      '子频道',
      '私聊',
      '最小化'
    ];

    var imageList = [
      'images/mlive_setting_item_clearWindow.png',
      'images/mlive_setting_item_hd.png',
      'images/mlive_setting_item_report.png',
      'images/mlive_setting_item_manage.png',
      'images/mlive_setting_item_plugin.png',
      'images/mlive_setting_item_manage.png',
      'images/mlive_setting_item_audio.png',
      'images/mlive_setting_item_subchannel.png',
      'images/mlive_setting_item_whisper.png',
      'images/mlive_setting_item_minimize.png'
    ];

    var funList = [
      'clearWindow',
      'hd',
      'report',
      'manage',
      'plugin',
      'manage',
      'audio',
      'subchannel',
      'hisper',
      'minimize'
    ];

    for (var i = 0; i < 10; i++) {
      var image = Image(image: new AssetImage(imageList[i]));
      var item = BasicMenuItem(nameList[i], image, funList[i]);
      functionItems.add(item);
    }
  }

  // 回调事件
  void _onEvent(Object event) {
    Map<String, dynamic> user = jsonDecode(event);
    // print("flutter方法调用" + user["first"]);
    // print("flutter方法调用" + user["second"]);
    list.add(user);
    //print("flutter方法调用" + list.toString());
    // setState(() {
    //   _counter = _counter ++;
    // });
  }

  // 错误返回
  void _onError(Object error) {}

  int _counter = 20;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  /**
   * 抽取item项
   */
  Widget _getContainer(BasicMenuItem item) {
    return new Container(
      color: Colors.blue,
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          item.image,
          Text(
            item.name,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          // Text(
          //   'You have pushed the button this many times:',
          // ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.display1,
          ),
          // Image(image: new AssetImage('images/ic_assignment_ind_36pt.png')),
          // Image(image: new AssetImage('images/ic_assignment_ind_36pt.png')),
          Container(
              // child: ListView(
              //   //控制方向 默认是垂直的
              //   scrollDirection: Axis.horizontal,
              //   itemExtent: 60,
              //   padding: const EdgeInsets.all(16.0),
              //   children: <Widget>[
              //     // for (BasicMenuItem item in functionItems) {
              //     //   _getContainer(item);
              //     // }

              //     // _getContainer('Maps', Icons.map),
              //     // _getContainer('phone', Icons.phone),
              //     // _getContainer('Maps', Icons.map),
              //     // _getContainer('Maps', Icons.map),
              //     // _getContainer('phone', Icons.phone),
              //     // _getContainer('Maps', Icons.map),
              //     // _getContainer('Maps', Icons.map),
              //     // _getContainer('phone', Icons.phone),
              //     // _getContainer('Maps', Icons.map),
              //     // _getContainer('Maps', Icons.map),
              //     // _getContainer('Maps', Icons.map),
              //     // _getContainer('phone', Icons.phone),
              //     // _getContainer('Maps', Icons.map),
              //   ],
              // ),
              child: new ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemExtent: 60,
                  itemCount: functionItems.length,
                  padding: const EdgeInsets.all(16.0),
                  itemBuilder: (context, i) {
                    return _getContainer(functionItems[i]);
                  }),
              height: 400,
              color: Colors.red),
        ],
      ),
    );
  }
}
