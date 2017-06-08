import Foundation
import Swinject

typealias SplashScreenModule = SplashScreenModuleInput & SplashScreenViewOutput & SplashScreenInteractorOutput

class SplashScreenFactory: Assembly {
    func assemble(container: Container) {
        container.register(SplashScreenModule.self) { r in
                    return SplashScreenPresenter()
                }
                .initCompleted { r, p in
                    let presenter = p as! SplashScreenPresenter
                    presenter.view = r.resolve(SplashScreenViewInput.self) as! SplashScreenViewController
                    presenter.router = r.resolve(SplashScreenRouterInput.self) as! SplashScreenRouter
                    presenter.interactor = r.resolve(SplashScreenInteractorInput.self) as! SplashScreenInteractor

                    _ = r.resolve(BaseModule.self, arguments: presenter as BaseModulePresenter, presenter.interactor as! BaseModuleInteractor, presenter.router as! BaseModuleRouter, presenter.view as! BaseModuleViewController)
                }

        container.register(SplashScreenViewInput.self) { _ in
                    UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SplashScreenView") as! SplashScreenViewController
                }
                .initCompleted { r, v in
                    let vc = v as! SplashScreenViewController
                    vc.output = r.resolve(SplashScreenViewOutput.self) as! SplashScreenPresenter
                }

        container.register(SplashScreenViewOutput.self) { r in
            r.resolve(SplashScreenModule.self)!
        }

        container.register(SplashScreenRouterInput.self) { _ in
                    SplashScreenRouter()
                }
                .initCompleted { r, p in
                    let router = p as! SplashScreenRouter
                    router.viewController = r.resolve(SplashScreenViewInput.self) as? UIViewController
                }

        container.register(SplashScreenInteractorInput.self) { _ in
                    SplashScreenInteractor()
                }
                .initCompleted { r, i in
                    let interactor = i as! SplashScreenInteractor
                    interactor.output = r.resolve(SplashScreenInteractorOutput.self) as! SplashScreenPresenter
                }

        container.register(SplashScreenInteractorOutput.self) { r in
            r.resolve(SplashScreenModule.self)!
        }
    }
}
