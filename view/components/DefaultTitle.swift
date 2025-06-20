//
//  defaultTitle.swift
//  QRCreator
//
//  Created by Enes Bayri on 18.06.2025.
//

import UIKit

class DefaultTitle : UIView{
    
    var titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = ColorHelper.mainColor
        label.font = UIFontHelper.defaultTitleFont
        label.textAlignment = .center
        label.text = StringConstants.startingTitle
        label.translatesAutoresizingMaskIntoConstraints = false 
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews(){
        self.addSubview(titleLabel)
    }
    
    override func layoutSubviews() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    
    
    
}
