import 'package:flutter/services.dart';

class NotificationCenter {
  static NotificationCenter _instance;
  factory NotificationCenter() {
    if (null == _instance) {
      _instance = NotificationCenter.private(
          EventChannel('plugins.yymobile/NotificationPluginEvent'),
          MethodChannel('plugins.yymobile/NotificationPluginMethod'));
    }
    return _instance;
  }

  NotificationCenter.private(this._eventChannel, this._methodChannel);

  EventChannel _eventChannel;
  MethodChannel _methodChannel;
  Stream<Map> _map;

  Future<dynamic> execute(String methodName) {
    return _methodChannel
        .invokeMethod(methodName)
        .then<dynamic>((dynamic value) => value);
  }

  Stream<Map> get onNotification {
    _map = _eventChannel.receiveBroadcastStream().map((dynamic event) {
      return Map.from(event);
    });
    return _map;
  }
}
