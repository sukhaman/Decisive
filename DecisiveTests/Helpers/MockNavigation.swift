//
//  Created by Sukhaman Singh on 2/12/24.
//

import XCTest
@testable import Decisive

class MockNavigationController: UINavigationController {
    
    var pushedViewController: UIViewController?
    var presentViewController: UIViewController?
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedViewController = viewController
        super.pushViewController(viewController, animated: true)
    }
    
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        super.popToRootViewController(animated: animated)
        return self.viewControllers
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        pushedViewController = nil
        super.popViewController(animated: animated)
        return self.topViewController
    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        presentViewController = viewControllerToPresent
        super.present(viewControllerToPresent, animated: flag, completion: completion)
        completion?()
    }
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        presentViewController = nil
        super.dismiss(animated: flag, completion: completion)
    }
    
    override func show(_ vc: UIViewController, sender: Any?) {
        pushedViewController = vc
        super.show(vc, sender: sender)
    }
    override func didMove(toParent parent: UIViewController?) {
        pushedViewController = parent
    }
}
