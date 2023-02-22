import UIKit
import Flutter
import Firebase
import GoogleMaps
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      FirebaseApp.configure() //add this before the code below
    GMSServices
        .provideAPIKey("AIzaSyDaclt4-LRbB7PlRls3WSsDBE4NWEeWJnw")
    GeneratedPluginRegistrant.register(with: self)
    AppCenter.start(withAppSecret: "{Your app secret here}", services:[
  Analytics.self,
  Crashes.self
])
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
}
