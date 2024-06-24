
import 'tw_keychain_platform_interface.dart';

class TwKeychain {
  Future<String?> getPlatformVersion() {
    return TwKeychainPlatform.instance.getPlatformVersion();
  }
}
