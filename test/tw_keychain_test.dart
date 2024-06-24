// import 'package:flutter_test/flutter_test.dart';
// import 'package:tw_keychain/tw_keychain.dart';
// import 'package:tw_keychain/tw_keychain_platform_interface.dart';
// import 'package:tw_keychain/tw_keychain_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockTwKeychainPlatform
//     with MockPlatformInterfaceMixin
//     implements TwKeychainPlatform {
//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final TwKeychainPlatform initialPlatform = TwKeychainPlatform.instance;

//   test('$MethodChannelTwKeychain is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelTwKeychain>());
//   });

//   test('getPlatformVersion', () async {
//     TwKeyChain twKeychainPlugin = TwKeyChain();
//     MockTwKeychainPlatform fakePlatform = MockTwKeychainPlatform();
//     TwKeychainPlatform.instance = fakePlatform;

//     expect(await twKeychainPlugin.getPlatformVersion(), '42');
//   });
// }
