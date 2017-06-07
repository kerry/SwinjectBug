import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var dependencyManager: DependencyManager = DependencyManager.getInstance()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        print("launching options called")

        let router = SplashScreenModuleConfigurator().getRouter()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = router.viewController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}
