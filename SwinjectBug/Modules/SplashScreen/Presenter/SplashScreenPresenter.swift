import Foundation

class SplashScreenPresenter: BaseModulePresenter, SplashScreenModuleInput, SplashScreenViewOutput, SplashScreenInteractorOutput {
    weak var view: SplashScreenViewInput!
    var interactor: SplashScreenInteractorInput!
    var router: SplashScreenRouterInput!

    override func viewIsReady() {
        //check app version here
        print("geloo")
    }
}
