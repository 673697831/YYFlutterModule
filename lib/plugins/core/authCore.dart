import 'package:flutter/services.dart';

class AuthCore {
  static AuthCore _instance;
  factory AuthCore() {
    if (null == _instance) {
      _instance = AuthCore.private(
          EventChannel('plugins.yymobile/AuthCorePluginEvent'),
          MethodChannel('plugins.yymobile/AuthCorePluginMethod'));
    }
    return _instance;
  }

  AuthCore.private(this._eventChannel, this._methodChannel);

  EventChannel _eventChannel;
  MethodChannel _methodChannel;
  Stream<int> _newUserId;

  Future<int> getUserId() => _methodChannel
      .invokeMethod('getUserId')
      .then<int>((dynamic value) => value);

  Stream<int> get onUserIdChange {
    if (null == _newUserId) {
      _newUserId = _eventChannel.receiveBroadcastStream().map((dynamic event) {
        var map = Map<String, int>.from(event);
        return map['userId'];
      });
    }
    return _newUserId;
  }
}
