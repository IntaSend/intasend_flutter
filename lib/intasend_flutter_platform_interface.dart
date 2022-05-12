import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'intasend_flutter_method_channel.dart';

abstract class IntasendFlutterPlatform extends PlatformInterface {
  /// Constructs a IntasendFlutterPlatform.
  IntasendFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static IntasendFlutterPlatform _instance = MethodChannelIntasendFlutter();

  /// The default instance of [IntasendFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelIntasendFlutter].
  static IntasendFlutterPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [IntasendFlutterPlatform] when
  /// they register themselves.
  static set instance(IntasendFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
