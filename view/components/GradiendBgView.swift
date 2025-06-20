//
//  GradiendBgView.swift
//  QRCreator
//
//  Created by Enes Bayri on 16.06.2025.
//

import UIKit

class GradientBackgroundView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addGradientBackground()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addGradientBackground()
    }
    
    private func addGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.systemBlue.cgColor,
            UIColor.systemPurple.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)   // sol üst
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)     // sağ alt
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Gradient’in frame’ini güncelle
        layer.sublayers?.first?.frame = bounds
    }
}
