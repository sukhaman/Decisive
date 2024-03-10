//
//  Created by Sukhaman Singh on 2/25/24.
//

import UIKit

class CustomLabelTextFieldView: UIView {
    var lblTitle = UILabel()
    var txtTitle = UITextField()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init(_ title: String?, _ placeholder: String?, isSecureEntry: Bool = false) {
        self.init()
        self.lblTitle.text = title
        self.txtTitle.placeholder = placeholder
        self.txtTitle.isSecureTextEntry = isSecureEntry
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints  = false
        isUserInteractionEnabled = true
        backgroundColor = .systemBackground
        addLabelTitle()
        addTextFieldName()
    }
    
    fileprivate func addLabelTitle() {
        self.addSubview(lblTitle)
        lblTitle.textColor = .appBlack
        lblTitle.font = .systemFont(ofSize: 16, weight: .bold)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lblTitle.topAnchor.constraint(equalTo: self.topAnchor),
            lblTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lblTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lblTitle.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    fileprivate func addTextFieldName() {
        self.addSubview(txtTitle)
        txtTitle.borderStyle = .roundedRect
        txtTitle.textColor = .appBlack
        txtTitle.backgroundColor = .appWhite
        txtTitle.translatesAutoresizingMaskIntoConstraints = false
        txtTitle.layer.borderColor = UIColor.appGrayPrimary.cgColor
        txtTitle.layer.borderWidth = 1
        NSLayoutConstraint.activate([
            txtTitle.topAnchor.constraint(equalTo: self.lblTitle.bottomAnchor,constant: 5),
            txtTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            txtTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            txtTitle.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
}
