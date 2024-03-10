//
//  Created by Sukhaman Singh on 2/28/24.
//

import Foundation

extension Bundle {
    static func setLanguage(_ language: String) {
        // Use swizzling or other mechanisms to set the desired language for testing
        UserDefaults.standard.set([language], forKey: "AppleLanguages")
    }

    static func resetLanguage() {
        // Reset the language to the default after testing
        UserDefaults.standard.removeObject(forKey: "AppleLanguages")
    }
}
