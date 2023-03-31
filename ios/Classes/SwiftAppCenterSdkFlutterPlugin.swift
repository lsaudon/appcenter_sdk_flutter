import Flutter
import UIKit
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes

public class SwiftAppCenterSdkFlutterPlugin: NSObject, FlutterPlugin, AppCenterApi, AppCenterAnalyticsApi, AppCenterCrashesApi {
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let binaryMessenger = registrar.messenger()
        let appCenterPlugin = SwiftAppCenterSdkFlutterPlugin()
        AppCenterApiSetup.setUp(binaryMessenger: binaryMessenger, api: appCenterPlugin)
        AppCenterAnalyticsApiSetup.setUp(binaryMessenger: binaryMessenger, api: appCenterPlugin)
        AppCenterCrashesApiSetup.setUp(binaryMessenger: binaryMessenger, api: appCenterPlugin)
    }
    
    // AppCenter
    func start(secret: String) {
        if (!AppCenter.isConfigured){
            AppCenter.start(withAppSecret: secret, services: [Analytics.self, Crashes.self])
        }
    }
    
    func setEnabled(enabled: Bool, completion: @escaping (Result<Void, Error>) -> Void) {
        AppCenter.enabled = enabled
        completion(.success(Void()))
    }
    
    func isEnabled(completion: @escaping (Result<Bool, Error>) -> Void) {
        completion(.success(AppCenter.enabled))
    }
    
    func isConfigured() -> Bool {
        return AppCenter.isConfigured
    }
    
    func getInstallId(completion: @escaping (Result<String, Error>) -> Void) {
        completion(.success(AppCenter.installId.uuidString))
    }
    
    func isRunningInAppCenterTestCloud() -> Bool {
        return AppCenter.isRunningInAppCenterTestCloud
    }
    // AppCenter
    // AppCenter Analytics
    func trackEvent(name: String, properties: [String : String]?, flags: Int64?)throws {
        if(flags == nil){
            Analytics.trackEvent(name, withProperties: properties)
        }else{
            Analytics.trackEvent(name, withProperties: properties, flags: Flags.init(rawValue: UInt.init(flags!)))
        }
    }
    
    func pause() {
        Analytics.pause()
    }
    
    func resume() {
        Analytics.resume()
    }
    
    func analyticsSetEnabled(enabled: Bool, completion: @escaping (Result<Void, Error>) -> Void) {
        Analytics.enabled = enabled
        completion(.success(Void()))
    }
    
    func analyticsIsEnabled(completion: @escaping (Result<Bool, Error>) -> Void) {
        completion(.success(Analytics.enabled))
    }
    
    func enableManualSessionTracker() {
        Analytics.enableManualSessionTracker()
    }
    
    func startSession() {
        Analytics.startSession()
    }
    
    func setTransmissionInterval(seconds: Int64) throws -> Bool {
        Analytics.transmissionInterval = UInt.init(seconds)
        return true
    }
    // AppCenter Analytics
    // AppCenter Crashes
    func generateTestCrash() {
        Crashes.generateTestCrash()
    }
    
    func hasReceivedMemoryWarningInLastSession(completion: @escaping (Result<Bool, Error>) -> Void) {
        completion(.success(Crashes.hasReceivedMemoryWarningInLastSession))
    }
    
    func hasCrashedInLastSession(completion: @escaping (Result<Bool, Error>) -> Void) {
        completion(.success(Crashes.hasCrashedInLastSession))
    }
    
    func crashesSetEnabled(enabled: Bool, completion: @escaping (Result<Void, Error>) -> Void) {
        Crashes.enabled = enabled
        completion(.success(Void()))
    }
    
    func crashesIsEnabled(completion: @escaping (Result<Bool, Error>) -> Void) {
        completion(.success(Crashes.enabled))
    }
    
    func trackException(message: String, type: String?, stackTrace: String?, properties: [String : String]?) {
        let exceptionModel = MSACWrapperExceptionModel()
        exceptionModel.message = message
        exceptionModel.type = type
        exceptionModel.stackTrace = stackTrace
        exceptionModel.wrapperSdkName = "appcenter.xamarin"
        Crashes.trackException(exceptionModel, properties: properties, attachments: nil)
    }
    // AppCenter Crashes
}
