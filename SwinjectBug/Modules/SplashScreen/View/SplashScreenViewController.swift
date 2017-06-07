import UIKit

class SplashScreenViewController: BaseModuleViewController, SplashScreenViewInput {

    var output: SplashScreenViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    // MARK: SplashScreenViewInput
    func setupInitialState() {
    }
}
