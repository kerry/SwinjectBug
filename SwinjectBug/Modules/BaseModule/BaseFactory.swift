import Foundation
import Swinject

typealias BaseModule = BaseModuleModuleInput & BaseModuleInteractorOutput & BaseModuleViewOutput
class BaseFactory: Assembly {
    func assemble(container: Container) {
        container.register(BaseModule.self) { (_, presenter: BaseModulePresenter, interactor: BaseModuleInteractor, router: BaseModuleRouter, viewController: BaseModuleViewController) in
            presenter.baseRouter = router
            presenter.baseInteractor = interactor
            presenter.baseView = viewController

            router.viewController = viewController

            interactor.baseOutput = presenter

            viewController.baseOutput = presenter

            return presenter
        }
    }
}
