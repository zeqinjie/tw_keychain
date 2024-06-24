import 'package:pigeon/pigeon.dart';

// https://github.com/flutter/packages/blob/main/packages/pigeon/example/README.md
@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/plugin/pigeon.g.dart',
  kotlinOut:
      'android/src/main/kotlin/com/tw/key_chain/KeyChainGeneratedApis.g.kt',
  kotlinOptions: KotlinOptions(
    // https://github.com/fluttercommunity/wakelock_plus/issues/18
    errorClassName: "TWKeyChainFlutterError",
  ),
  swiftOut: 'ios/Classes/TWKeyChainGeneratedApis.g.swift',
))
@HostApi()
abstract class TwKeyChainHostApi {
  /// Fetches a value from the keychain.
  /// [key] is the key to fetch.
  /// [service] is the service to fetch from.
  /// [accessGroup] is the access group to fetch from.
  /// Returns the value stored in the keychain.
  String fetchKeyChain({
    required String key,
    String? service,
    String? accessGroup,
  });

  /// Saves a value to the keychain.
  /// [key] is the key to save.
  /// [value] is the value to save.
  /// [service] is the service to save to.
  /// [accessGroup] is the access group to save to.
  void saveKeyChain({
    required String key,
    required String value,
    String? service,
    String? accessGroup,
  });
}
