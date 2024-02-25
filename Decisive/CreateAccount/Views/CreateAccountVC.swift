//
//  Created by Sukhaman Singh on 2/25/24.
//

import UIKit

import UIKit

class CreateAccountVC: UIViewController {
    let scrollView = UIScrollView()
    let contentView = UIView()
    let firstNameView = CustomLabelTextFieldView("First Name:", "Enter your first name")
    fileprivate func addScrollView() {
        // Create a scroll view
        view.backgroundColor = .systemBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.backgroundColor = .systemBackground
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    fileprivate func addContentView() {
        // Create a content view inside the scroll view
        contentView.backgroundColor = .systemBackground
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    

    
    fileprivate func addFirstNameView() {
        contentView.addSubview(firstNameView)
        
        // Auto Layout constraints
        NSLayoutConstraint.activate([
            firstNameView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            firstNameView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            firstNameView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            firstNameView.heightAnchor.constraint(equalToConstant: 80),
            contentView.bottomAnchor.constraint(equalTo: firstNameView.bottomAnchor, constant: 30)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addScrollView()
        
        addContentView()
        addFirstNameView()
    }
}
