import Flutter
import UIKit
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes

public class SwiftAppCenterSdkFlutterPlugin: NSObject, FlutterPlugin, AppCenterApi, AppCenterAnalyticsApi, AppCenterCrashesApi {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let binaryMessenger : FlutterBinaryMessenger = registrar.messenger()
        AppCenterApiSetup.setUp(binaryMessenger: binaryMessenger, api: SwiftAppCenterSdkFlutterPlugin.init())
        AppCenterAnalyticsApiSetup.setUp(binaryMessenger: binaryMessenger, api: SwiftAppCenterSdkFlutterPlugin.init())
        AppCenterCrashesApiSetup.setUp(binaryMessenger: binaryMessenger, api: SwiftAppCenterSdkFlutterPlugin.init())
    }
    
    // AppCenter
    func start(secret: String) {
        if (!AppCenter.isConfigured){
            AppCenter.start(withAppSecret: secret, services: [Analytics.self, Crashes.self])
        }
    }
    
    func setEnabled(enabled: Bool, completion: @escaping () -> Void) {
        AppCenter.enabled = enabled
        completion()
    }
    
    func isEnabled(completion: @escaping (Bool) -> Void) {
        completion(AppCenter.enabled)
    }
    
    func isConfigured() -> Bool {
        return AppCenter.isConfigured
    }
    
    func getInstallId(completion: @escaping (String) -> Void) {
        completion(AppCenter.installId.uuidString)
    }
    
    func isRunningInAppCenterTestCloud() -> Bool {
        return AppCenter.isRunningInAppCenterTestCloud
    }
    // AppCenter
    // AppCenter Analytics
    func trackEvent(name: String, properties: [String : String]?, flags: Int32?) {
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
    
    func analyticsSetEnabled(enabled: Bool, completion: @escaping () -> Void) {
        Analytics.enabled = enabled
        completion()
    }
    
    func analyticsIsEnabled(completion: @escaping (Bool) -> Void) {
        completion(Analytics.enabled)
    }
    
    func enableManualSessionTracker() {
        Analytics.enableManualSessionTracker()
    }
    
    func startSession() {
        Analytics.startSession()
    }
    
    func setTransmissionInterval(seconds: Int32) -> Bool {
        Analytics.transmissionInterval = UInt.init(seconds)
        return true
    }
    // AppCenter Analytics
    // AppCenter Crashes
    func generateTestCrash() {
        Crashes.generateTestCrash()
    }
    
    func hasReceivedMemoryWarningInLastSession(completion: @escaping (Bool) -> Void) {
        completion(Crashes.hasReceivedMemoryWarningInLastSession)
    }
    
    func hasCrashedInLastSession(completion: @escaping (Bool) -> Void) {
        completion(Crashes.hasCrashedInLastSession)
    }
    
    func crashesSetEnabled(enabled: Bool, completion: @escaping () -> Void) {
        Crashes.enabled = enabled
        completion()
    }
    
    func crashesIsEnabled(completion: @escaping (Bool) -> Void) {
        completion(Crashes.enabled)
    }
    
    func trackException(message: String, type: String?, stackTrace: String?, properties: [String : String]?) {
        let exceptionModel = MSACWrapperExceptionModel()
        exceptionModel.message = message
        exceptionModel.type = type
        exceptionModel.stackTrace = stackTrace
        exceptionModel.wrapperSdkName = "appcenter.react-native"
        Crashes.trackException(exceptionModel, properties: properties, attachments: nil)
    }
    // AppCenter Crashes
}
