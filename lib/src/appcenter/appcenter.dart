import 'package:appcenter_sdk_flutter/src/appcenter/appcenter_platform_interface.dart';
import 'package:meta/meta.dart';

/// [AppCenter]
class AppCenter {
  @visibleForTesting
  // Because
  // ignore: avoid_setters_without_getters
  static set instance(final AppCenterPlatformInterface instance) {
    AppCenterPlatformInterface.instance = instance;
  }

  /// Configure the SDK with the list of services to start with an app secret
  /// parameter.
  ///
  /// This may be called only once per application process lifetime.
  ///
  /// [secret] – A unique and secret key used to identify the application.
  static Future<void> start({required final String secret}) =>
      AppCenterPlatformInterface.instance.start(secret: secret);

  /// Enable the SDK as a whole.
  static Future<void> enable() => AppCenterPlatformInterface.instance.enable();

  /// Disable the SDK as a whole.
  static Future<void> disable() =>
      AppCenterPlatformInterface.instance.disable();

  /// Check whether the SDK is enabled or not as a whole.
  static Future<bool> isEnabled() =>
      AppCenterPlatformInterface.instance.isEnabled();

  /// Check whether SDK has already been configured.
  ///
  /// Returns: true if configured, false otherwise.
  static Future<bool> isConfigured() =>
      AppCenterPlatformInterface.instance.isConfigured();

  /// Get a unique installation identifier.
  ///
  /// The identifier is persisted until the application is uninstalled and
  /// installed again.
  ///
  /// This operation is performed in background as it accesses SharedPreferences
  /// and UUID.
  static Future<String> getInstallId() =>
      AppCenterPlatformInterface.instance.getInstallId();

  /// Check whether app is running in App Center Test.
  ///
  /// Returns: true if running in App Center Test, false otherwise (and where no
  /// test dependencies in release).
  static Future<bool> isRunningInAppCenterTestCloud() =>
      AppCenterPlatformInterface.instance.isRunningInAppCenterTestCloud();
}
