// Autogenerated from Pigeon (v20.0.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon
@file:Suppress("UNCHECKED_CAST", "ArrayInDataClass")


import android.util.Log
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MessageCodec
import io.flutter.plugin.common.StandardMessageCodec
import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer

private fun wrapResult(result: Any?): List<Any?> {
  return listOf(result)
}

private fun wrapError(exception: Throwable): List<Any?> {
  return if (exception is TWKeyChainFlutterError) {
    listOf(
      exception.code,
      exception.message,
      exception.details
    )
  } else {
    listOf(
      exception.javaClass.simpleName,
      exception.toString(),
      "Cause: " + exception.cause + ", Stacktrace: " + Log.getStackTraceString(exception)
    )
  }
}

/**
 * Error class for passing custom error details to Flutter via a thrown PlatformException.
 * @property code The error code.
 * @property message The error message.
 * @property details The error details. Must be a datatype supported by the api codec.
 */
class TWKeyChainFlutterError (
  val code: String,
  override val message: String? = null,
  val details: Any? = null
) : Throwable()
private object KeyChainGeneratedApisPigeonCodec : StandardMessageCodec() {
  override fun readValueOfType(type: Byte, buffer: ByteBuffer): Any? {
    return     super.readValueOfType(type, buffer)
  }
  override fun writeValue(stream: ByteArrayOutputStream, value: Any?)   {
    super.writeValue(stream, value)
  }
}

/** Generated interface from Pigeon that represents a handler of messages from Flutter. */
interface TwKeyChainHostApi {
  /**
   * Fetches a value from the keychain.
   * [key] is the key to fetch.
   * [service] is the service to fetch from.
   * [accessGroup] is the access group to fetch from.
   * Returns the value stored in the keychain.
   */
  fun fetchKeyChain(key: String, service: String?, accessGroup: String?): String
  /**
   * Saves a value to the keychain.
   * [key] is the key to save.
   * [value] is the value to save.
   * [service] is the service to save to.
   * [accessGroup] is the access group to save to.
   */
  fun saveKeyChain(key: String, value: String, service: String?, accessGroup: String?)

  companion object {
    /** The codec used by TwKeyChainHostApi. */
    val codec: MessageCodec<Any?> by lazy {
      KeyChainGeneratedApisPigeonCodec
    }
    /** Sets up an instance of `TwKeyChainHostApi` to handle messages through the `binaryMessenger`. */
    @JvmOverloads
    fun setUp(binaryMessenger: BinaryMessenger, api: TwKeyChainHostApi?, messageChannelSuffix: String = "") {
      val separatedMessageChannelSuffix = if (messageChannelSuffix.isNotEmpty()) ".$messageChannelSuffix" else ""
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.tw_keychain.TwKeyChainHostApi.fetchKeyChain$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val keyArg = args[0] as String
            val serviceArg = args[1] as String?
            val accessGroupArg = args[2] as String?
            val wrapped: List<Any?> = try {
              listOf(api.fetchKeyChain(keyArg, serviceArg, accessGroupArg))
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
      run {
        val channel = BasicMessageChannel<Any?>(binaryMessenger, "dev.flutter.pigeon.tw_keychain.TwKeyChainHostApi.saveKeyChain$separatedMessageChannelSuffix", codec)
        if (api != null) {
          channel.setMessageHandler { message, reply ->
            val args = message as List<Any?>
            val keyArg = args[0] as String
            val valueArg = args[1] as String
            val serviceArg = args[2] as String?
            val accessGroupArg = args[3] as String?
            val wrapped: List<Any?> = try {
              api.saveKeyChain(keyArg, valueArg, serviceArg, accessGroupArg)
              listOf(null)
            } catch (exception: Throwable) {
              wrapError(exception)
            }
            reply.reply(wrapped)
          }
        } else {
          channel.setMessageHandler(null)
        }
      }
    }
  }
}
