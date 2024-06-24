import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'tw_keychain_platform_interface.dart';

/// An implementation of [TwKeychainPlatform] that uses method channels.
class MethodChannelTwKeychain extends TwKeychainPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('tw_keychain');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
