//
//  QRDownloadButton.swift
//  QRCreator
//
//  Created by Enes Bayri on 16.06.2025.
//

import UIKit

class IconTextButtonView: UIView {
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "tray.and.arrow.down"))
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Download QR"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFontHelper.detailsPageSubtitleFont
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        view.alpha = 0
        view.isUserInteractionEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var onTap: (() -> Void)?
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupTapGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = ColorHelper.mainColor
        self.layer.cornerRadius = 16
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(iconImageView)
        self.addSubview(titleLabel)
        self.addSubview(overlayView)
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            iconImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 28),
            iconImageView.heightAnchor.constraint(equalToConstant: 28),
            
            titleLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 2),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 2),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -2),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            
            overlayView.topAnchor.constraint(equalTo: self.topAnchor),
            overlayView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            overlayView.leftAnchor.constraint(equalTo: self.leftAnchor),
            overlayView.rightAnchor.constraint(equalTo: self.rightAnchor),
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
