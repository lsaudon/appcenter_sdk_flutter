// Autogenerated from Pigeon (v7.2.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif



private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)"
  ]
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol AppCenterApi {
  func start(secret: String) throws
  func setEnabled(enabled: Bool, completion: @escaping (Result<Void, Error>) -> Void)
  func isEnabled(completion: @escaping (Result<Bool, Error>) -> Void)
  func isConfigured() throws -> Bool
  func getInstallId(completion: @escaping (Result<String, Error>) -> Void)
  func isRunningInAppCenterTestCloud() throws -> Bool
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class AppCenterApiSetup {
  /// The codec used by AppCenterApi.
  /// Sets up an instance of `AppCenterApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: AppCenterApi?) {
    let startChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.AppCenterApi.start", binaryMessenger: binaryMessenger)
    if let api = api {
      startChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let secretArg = args[0] as! String
        do {
          try api.start(secret: secretArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      startChannel.setMessageHandler(nil)
    }
    let setEnabledChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.AppCenterApi.setEnabled", binaryMessenger: binaryMessenger)
    if let api = api {
      setEnabledChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let enabledArg = args[0] as! Bool
        api.setEnabled(enabled: enabledArg) { result in
          switch result {
            case .success:
              reply(wrapResult(nil))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      setEnabledChannel.setMessageHandler(nil)
    }
    let isEnabledChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.AppCenterApi.isEnabled", binaryMessenger: binaryMessenger)
    if let api = api {
      isEnabledChannel.setMessageHandler { _, reply in
        api.isEnabled() { result in
          switch result {
            case .success(let res):
              reply(wrapResult(res))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      isEnabledChannel.setMessageHandler(nil)
    }
    let isConfiguredChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.AppCenterApi.isConfigured", binaryMessenger: binaryMessenger)
    if let api = api {
      isConfiguredChannel.setMessageHandler { _, reply in
        do {
          let result = try api.isConfigured()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      isConfiguredChannel.setMessageHandler(nil)
    }
    let getInstallIdChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.AppCenterApi.getInstallId", binaryMessenger: binaryMessenger)
    if let api = api {
      getInstallIdChannel.setMessageHandler { _, reply in
        api.getInstallId() { result in
          switch result {
            case .success(let res):
              reply(wrapResult(res))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      getInstallIdChannel.setMessageHandler(nil)
    }
    let isRunningInAppCenterTestCloudChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.AppCenterApi.isRunningInAppCenterTestCloud", binaryMessenger: binaryMessenger)
    if let api = api {
      isRunningInAppCenterTestCloudChannel.setMessageHandler { _, reply in
        do {
          let result = try api.isRunningInAppCenterTestCloud()
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      isRunningInAppCenterTestCloudChannel.setMessageHandler(nil)
    }
  }
}
/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol AppCenterAnalyticsApi {
  func trackEvent(name: String, properties: [String: String]?, flags: Int32?) throws
  func pause() throws
  func resume() throws
  func analyticsSetEnabled(enabled: Bool, completion: @escaping (Result<Void, Error>) -> Void)
  func analyticsIsEnabled(completion: @escaping (Result<Bool, Error>) -> Void)
  func enableManualSessionTracker() throws
  func startSession() throws
  func setTransmissionInterval(seconds: Int32) throws -> Bool
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class AppCenterAnalyticsApiSetup {
  /// The codec used by AppCenterAnalyticsApi.
  /// Sets up an instance of `AppCenterAnalyticsApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: AppCenterAnalyticsApi?) {
    let trackEventChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.AppCenterAnalyticsApi.trackEvent", binaryMessenger: binaryMessenger)
    if let api = api {
      trackEventChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let nameArg = args[0] as! String
        let propertiesArg = args[1] as? [String: String]
        let flagsArg = args[2] as? Int32
        do {
          try api.trackEvent(name: nameArg, properties: propertiesArg, flags: flagsArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      trackEventChannel.setMessageHandler(nil)
    }
    let pauseChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.AppCenterAnalyticsApi.pause", binaryMessenger: binaryMessenger)
    if let api = api {
      pauseChannel.setMessageHandler { _, reply in
        do {
          try api.pause()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      pauseChannel.setMessageHandler(nil)
    }
    let resumeChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.AppCenterAnalyticsApi.resume", binaryMessenger: binaryMessenger)
    if let api = api {
      resumeChannel.setMessageHandler { _, reply in
        do {
          try api.resume()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      resumeChannel.setMessageHandler(nil)
    }
    let analyticsSetEnabledChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.AppCenterAnalyticsApi.analyticsSetEnabled", binaryMessenger: binaryMessenger)
    if let api = api {
      analyticsSetEnabledChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let enabledArg = args[0] as! Bool
        api.analyticsSetEnabled(enabled: enabledArg) { result in
          switch result {
            case .success:
              reply(wrapResult(nil))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      analyticsSetEnabledChannel.setMessageHandler(nil)
    }
    let analyticsIsEnabledChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.AppCenterAnalyticsApi.analyticsIsEnabled", binaryMessenger: binaryMessenger)
    if let api = api {
      analyticsIsEnabledChannel.setMessageHandler { _, reply in
        api.analyticsIsEnabled() { result in
          switch result {
            case .success(let res):
              reply(wrapResult(res))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      analyticsIsEnabledChannel.setMessageHandler(nil)
    }
    let enableManualSessionTrackerChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.AppCenterAnalyticsApi.enableManualSessionTracker", binaryMessenger: binaryMessenger)
    if let api = api {
      enableManualSessionTrackerChannel.setMessageHandler { _, reply in
        do {
          try api.enableManualSessionTracker()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      enableManualSessionTrackerChannel.setMessageHandler(nil)
    }
    let startSessionChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.AppCenterAnalyticsApi.startSession", binaryMessenger: binaryMessenger)
    if let api = api {
      startSessionChannel.setMessageHandler { _, reply in
        do {
          try api.startSession()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      startSessionChannel.setMessageHandler(nil)
    }
    let setTransmissionIntervalChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.AppCenterAnalyticsApi.setTransmissionInterval", binaryMessenger: binaryMessenger)
    if let api = api {
      setTransmissionIntervalChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let secondsArg = args[0] as! Int32
        do {
          let result = try api.setTransmissionInterval(seconds: secondsArg)
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      setTransmissionIntervalChannel.setMessageHandler(nil)
    }
  }
}
/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol AppCenterCrashesApi {
  func generateTestCrash() throws
  func hasReceivedMemoryWarningInLastSession(completion: @escaping (Result<Bool, Error>) -> Void)
  func hasCrashedInLastSession(completion: @escaping (Result<Bool, Error>) -> Void)
  func crashesSetEnabled(enabled: Bool, completion: @escaping (Result<Void, Error>) -> Void)
  func crashesIsEnabled(completion: @escaping (Result<Bool, Error>) -> Void)
  func trackException(message: String, type: String?, stackTrace: String?, properties: [String: String]?) throws
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class AppCenterCrashesApiSetup {
  /// The codec used by AppCenterCrashesApi.
  /// Sets up an instance of `AppCenterCrashesApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: AppCenterCrashesApi?) {
    let generateTestCrashChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.AppCenterCrashesApi.generateTestCrash", binaryMessenger: binaryMessenger)
    if let api = api {
      generateTestCrashChannel.setMessageHandler { _, reply in
        do {
          try api.generateTestCrash()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      generateTestCrashChannel.setMessageHandler(nil)
    }
    let hasReceivedMemoryWarningInLastSessionChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.AppCenterCrashesApi.hasReceivedMemoryWarningInLastSession", binaryMessenger: binaryMessenger)
    if let api = api {
      hasReceivedMemoryWarningInLastSessionChannel.setMessageHandler { _, reply in
        api.hasReceivedMemoryWarningInLastSession() { result in
          switch result {
            case .success(let res):
              reply(wrapResult(res))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      hasReceivedMemoryWarningInLastSessionChannel.setMessageHandler(nil)
    }
    let hasCrashedInLastSessionChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.AppCenterCrashesApi.hasCrashedInLastSession", binaryMessenger: binaryMessenger)
    if let api = api {
      hasCrashedInLastSessionChannel.setMessageHandler { _, reply in
        api.hasCrashedInLastSession() { result in
          switch result {
            case .success(let res):
              reply(wrapResult(res))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      hasCrashedInLastSessionChannel.setMessageHandler(nil)
    }
    let crashesSetEnabledChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.AppCenterCrashesApi.crashesSetEnabled", binaryMessenger: binaryMessenger)
    if let api = api {
      crashesSetEnabledChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let enabledArg = args[0] as! Bool
        api.crashesSetEnabled(enabled: enabledArg) { result in
          switch result {
            case .success:
              reply(wrapResult(nil))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      crashesSetEnabledChannel.setMessageHandler(nil)
    }
    let crashesIsEnabledChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.AppCenterCrashesApi.crashesIsEnabled", binaryMessenger: binaryMessenger)
    if let api = api {
      crashesIsEnabledChannel.setMessageHandler { _, reply in
        api.crashesIsEnabled() { result in
          switch result {
            case .success(let res):
              reply(wrapResult(res))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      crashesIsEnabledChannel.setMessageHandler(nil)
    }
    let trackExceptionChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.AppCenterCrashesApi.trackException", binaryMessenger: binaryMessenger)
    if let api = api {
      trackExceptionChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let messageArg = args[0] as! String
        let typeArg = args[1] as? String
        let stackTraceArg = args[2] as? String
        let propertiesArg = args[3] as? [String: String]
        do {
          try api.trackException(message: messageArg, type: typeArg, stackTrace: stackTraceArg, properties: propertiesArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      trackExceptionChannel.setMessageHandler(nil)
    }
  }
}
