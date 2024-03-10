//
//  Created by Sukhaman Singh on 2/13/24.
//

import Foundation

struct LoginUIComposer {
    
    static func createLoginModule(_ viewModel: LoginViewModel) -> LoginVC {
        let view = LoginVC()
        view.viewModel = viewModel
        return view
    }
}
