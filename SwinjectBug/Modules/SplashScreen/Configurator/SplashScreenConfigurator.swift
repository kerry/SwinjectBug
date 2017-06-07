import UIKit

class SplashScreenModuleConfigurator: BaseModuleModuleConfigurator {
    func getRouter() -> SplashScreenRouter {
        let splashPresenter = DependencyManager.getInstance().assembler.resolver.resolve(SplashScreenModule.self) as! SplashScreenPresenter
        return splashPresenter.router as! SplashScreenRouter
    }
}
