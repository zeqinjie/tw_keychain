import Flutter
import UIKit
import UICKeyChainStore

public class TwKeychainPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    // 注册实现
    TwKeyChainHostApiSetup.setUp(
      binaryMessenger: registrar.messenger(),
      api: TWKeyChainHostApiImplementation()
    )
  }
}

class TWKeyChainHostApiImplementation: TwKeyChainHostApi {
  /// Fetches a value from the keychain.
  /// [key] is the key to fetch.
  /// [service] is the service to fetch from.
  /// [accessGroup] is the access group to fetch from.
  /// Returns the value stored in the keychain.
  func fetchKeyChain(key: String, service: String?, accessGroup: String?) throws -> String {
    let res = UICKeyChainStore.string(forKey: key, service: service, accessGroup: accessGroup)
    return res ?? ""
  }
  
  /// Saves a value to the keychain.
  /// [key] is the key to save.
  /// [value] is the value to save.
  /// [service] is the service to save to.
  /// [accessGroup] is the access group to save to.
  func saveKeyChain(key: String, value: String, service: String?, accessGroup: String?) throws {
    UICKeyChainStore.setString(value, forKey: key, service: service, accessGroup: accessGroup)
  }
}
