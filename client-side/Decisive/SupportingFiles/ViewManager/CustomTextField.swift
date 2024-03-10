//
//  CustomTextField.swift
//  Decisive
//
//  Created by Sukhaman Singh on 2/11/24.
//

import UIKit

class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
   
    convenience init(placeholder: String) {
        self.init(frame: .zero)
        self.placeholder = placeholder
        
       
    }
    
    private func configure() {
        textColor = UIColor(resource: .appBlack)
        textAlignment = .left
        translatesAutoresizingMaskIntoConstraints = false
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        leftView = paddingView
        leftViewMode = UITextField.ViewMode.always
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
        
    }
    
    
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }
    
    

}
