import Foundation
import Swinject

class DependencyManager {
    private static let sharedInstance = DependencyManager()

    var assembler: Assembler
    
    class func getInstance() -> DependencyManager {
        return self.sharedInstance
    }

    init() {
        self.assembler = Assembler([
                BaseFactory(),
                SplashScreenFactory()
        ])
    }
}
