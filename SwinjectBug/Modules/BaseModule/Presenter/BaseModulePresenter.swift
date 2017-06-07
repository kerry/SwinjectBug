import Foundation

class BaseModulePresenter: NSObject, BaseModuleModuleInput, BaseModuleViewOutput, BaseModuleInteractorOutput {
    weak var baseView: BaseModuleViewInput!
    var baseInteractor: BaseModuleInteractorInput!
    var baseRouter: BaseModuleRouterInput!
    

    func viewIsReady() {

    }
}
