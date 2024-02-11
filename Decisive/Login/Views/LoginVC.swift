//
//  Created by Sukhaman Singh on 2/11/24.
//

import UIKit

class LoginVC: UIViewController {
    var backgroundAvatar = UIImageView(frame: .zero)
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        self.addBackgroundImageView()
    }
    
    func addBackgroundImageView() {
        self.view.addSubview(self.backgroundAvatar)
        self.backgroundAvatar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.backgroundAvatar.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.backgroundAvatar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.backgroundAvatar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.backgroundAvatar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        self.backgroundAvatar.image = UIImage(resource: .samaraDoole)
    }
}
