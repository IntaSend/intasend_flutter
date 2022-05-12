import 'package:flutter_test/flutter_test.dart';
import 'package:intasend_flutter/intasend_flutter.dart';
import 'package:intasend_flutter/intasend_flutter_platform_interface.dart';
import 'package:intasend_flutter/intasend_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockIntasendFlutterPlatform 
    with MockPlatformInterfaceMixin
    implements IntasendFlutterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final IntasendFlutterPlatform initialPlatform = IntasendFlutterPlatform.instance;

  test('$MethodChannelIntasendFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelIntasendFlutter>());
  });

  test('getPlatformVersion', () async {
    IntasendFlutter intasendFlutterPlugin = IntasendFlutter();
    MockIntasendFlutterPlatform fakePlatform = MockIntasendFlutterPlatform();
    IntasendFlutterPlatform.instance = fakePlatform;
  
    expect(await intasendFlutterPlugin.getPlatformVersion(), '42');
  });
}
