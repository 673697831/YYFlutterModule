import 'package:flutter_boost/flutter_boost.dart';

yyLogInfo(String msg) {
  print('YY[info]' + msg);
}

String yyWebURI(String url) {
  var encoded = Uri.encodeComponent(url);
  return 'yymobile://Web/AsynWebView/Features/5/Url/' + encoded;
}

yyGoToWeb(String url) {
  FlutterBoost.singleton.openPage(yyWebURI(url), {}, animated: true);
}

yyGoTo(String uri) {
  FlutterBoost.singleton.openPage(uri, {}, animated: true);
}

yyPushViewController(String name) {
  FlutterBoost.singleton.openPage(name, {'push': 1}, animated: true);
}

yyPushFlutter(String name) {
  FlutterBoost.singleton
      .openPage(name, {'preferredNavigationBarHidden': 1}, animated: true);
}
