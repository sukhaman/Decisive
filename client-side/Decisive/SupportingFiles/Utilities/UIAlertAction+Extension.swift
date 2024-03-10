//
//  Created by Sukhaman Singh on 3/10/24.
//

import UIKit

extension UIAlertAction {
    @objc class func makeActionWithTitle(title: String?, style: UIAlertAction.Style, handler: ((UIAlertAction) -> Void)?) -> UIAlertAction {
        return UIAlertAction(title: title, style: style, handler: handler)
    }
}
