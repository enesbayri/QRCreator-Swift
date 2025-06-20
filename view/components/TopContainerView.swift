//
//  TopContainerView.swift
//  QRCreator
//
//  Created by Enes Bayri on 16.06.2025.
//

import UIKit

class TopContainerView: UIView {
    
    var homeView : UIViewController!
    
    var mainTitle : UILabel = {
        let label = UILabel()
        label.textColor = ColorHelper.bgColor
        label.font = UIFontHelper.mainTitleFont
        label.text = "QR CREATOR"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.text = "QR Content"
        label.textColor = ColorHelper.bgColor
        label.font = UIFontHelper.contentLabelFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var contentField: UITextView = {
       let textField = UITextView()
        textField.backgroundColor = .systemGray6
        textField.borderStyle = .none
        textField.layer.cornerRadius = 20
        textField.clipsToBounds = true
        textField.font = UIFontHelper.contentLabelFont
        textField.textColor = ColorHelper.mainColor
        textField.isUserInteractionEnabled = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    var sizeField: UITextField = {
       let textField = UITextField()
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 20
        textField.placeholder = "QR Size (ex:150)"
        textField.borderStyle = .none
        textField.clipsToBounds = true
        textField.font = UIFontHelper.contentLabelFont
        textField.textColor = ColorHelper.mainColor

        // Sol padding
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    init() {
        super.init(frame: .zero)
        backgroundColor = ColorHelper.mainColor
        translatesAutoresizingMaskIntoConstraints = false
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        
        self.addSubview(mainTitle)
        self.addSubview(contentField)
        self.addSubview(sizeField)
        self.addSubview(contentLabel)
    }
    
    

    private func setupConstraints() {
        self.layer.cornerRadius = 190
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        self.clipsToBounds = true
        
        
        NSLayoutConstraint.activate([
            mainTitle.centerYAnchor.constraint(equalTo: self.topAnchor, constant: 75),
            mainTitle.leftAnchor.constraint(equalTo: self.leftAnchor , constant: 25),
            mainTitle.heightAnchor.constraint(equalToConstant: 40),
            mainTitle.widthAnchor.constraint(equalToConstant: 250),
            
            contentLabel.centerYAnchor.constraint(equalTo: contentField.topAnchor, constant: -10),
            contentLabel.leadingAnchor.constraint(equalTo: contentField.leadingAnchor),
            contentLabel.heightAnchor.constraint(equalToConstant: 20),
            contentLabel.widthAnchor.constraint(equalTo: self.widthAnchor , multiplier: 0.8),
            
            contentField.centerYAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: 100),
            contentField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            contentField.widthAnchor.constraint(equalTo: self.widthAnchor , multiplier: 0.8),
            contentField.heightAnchor.constraint(equalTo: self.heightAnchor , multiplier: 0.35),
            
            sizeField.centerYAnchor.constraint(equalTo: contentField.bottomAnchor, constant: 40),
            sizeField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            sizeField.widthAnchor.constraint(equalTo: self.widthAnchor , multiplier: 0.8),
            sizeField.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
}
