import 'package:tw_keychain/plugin/pigeon.g.dart';

class TwKeyChain {
  TwKeyChain._internal();

  factory TwKeyChain() => _instance;

  static final TwKeyChain _instance = TwKeyChain._internal();

  final TwKeyChainHostApi _hostApi = TwKeyChainHostApi();

  /// Fetches a value from the keychain.
  /// [key] is the key to fetch.
  /// [service] is the service to fetch from.
  /// [accessGroup] is the access group to fetch from.
  /// Returns the value stored in the keychain.
  Future<String> fetchKeyChain({
    required String key,
    String? service,
    String? accessGroup,
  }) async {
    return _hostApi.fetchKeyChain(
        key: key, service: service, accessGroup: accessGroup);
  }

  /// Saves a value to the keychain.
  /// [key] is the key to save.
  /// [value] is the value to save.
  /// [service] is the service to save to.
  /// [accessGroup] is the access group to save to.
  Future<void> saveKeyChain({
    required String key,
    required String value,
    String? service,
    String? accessGroup,
  }) async {
    return _hostApi.saveKeyChain(
      key: key,
      value: value,
      service: service,
      accessGroup: accessGroup,
    );
  }
}
