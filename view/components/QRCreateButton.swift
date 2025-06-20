//
//  QRCreateButton.swift
//  QRCreator
//
//  Created by Enes Bayri on 16.06.2025.
//

import UIKit

class QRCreateButton : UIView {
    
    var onTap: (() -> Void)?
    
    var buttonImage : UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "qrcode"))
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        view.alpha = 0
        view.isUserInteractionEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = ColorHelper.mainColor
        self.translatesAutoresizingMaskIntoConstraints = false
        setupView()
        setupTapGesture()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.addSubview(overlayView)
        self.addSubview(buttonImage)
    }
    
    override func layoutSubviews() {
        NSLayoutConstraint.activate([
            buttonImage.widthAnchor.constraint(equalToConstant: 120),
            buttonImage.heightAnchor.constraint(equalToConstant: 120),
            buttonImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            buttonImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            overlayView.widthAnchor.constraint(equalTo: self.widthAnchor),
            overlayView.heightAnchor.constraint(equalTo: self.heightAnchor),
            overlayView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            overlayView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    
    private func setupTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        self.addGestureRecognizer(tap)
    }
    
    @objc private func didTap() {
        // Görsel buton efekti
        animateTapEffect()
                
        // Tıklama işlemini tetikle
        onTap?()
    }
    
    private func animateTapEffect() {
        UIView.animate(withDuration: 0.1, animations: {
            self.overlayView.alpha = 1
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { _ in
            UIView.animate(withDuration: 0.2) {
                self.overlayView.alpha = 0
                self.transform = .identity
            }
        }
    }
}
