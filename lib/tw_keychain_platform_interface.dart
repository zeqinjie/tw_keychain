import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'tw_keychain_method_channel.dart';

abstract class TwKeychainPlatform extends PlatformInterface {
  /// Constructs a TwKeychainPlatform.
  TwKeychainPlatform() : super(token: _token);

  static final Object _token = Object();

  static TwKeychainPlatform _instance = MethodChannelTwKeychain();

  /// The default instance of [TwKeychainPlatform] to use.
  ///
  /// Defaults to [MethodChannelTwKeychain].
  static TwKeychainPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TwKeychainPlatform] when
  /// they register themselves.
  static set instance(TwKeychainPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
