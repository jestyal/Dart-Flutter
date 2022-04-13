import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyDAQ8zOOfMIjmdmON_8Pabbu0eQ8wlpZq8")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
