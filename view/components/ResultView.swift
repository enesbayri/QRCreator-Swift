//
//  ResultView.swift
//  QRCreator
//
//  Created by Enes Bayri on 16.06.2025.
//

import UIKit

class QRResultView: UIView {
    

    var onTap: (() -> Void)?
    
    var qrResultTitle : UILabel = {
        let label = UILabel()
        label.textColor = ColorHelper.mainColor
        label.font = UIFontHelper.qrResultTitleFont
        label.text = StringConstants.qrSuccessTitle
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var qrResultSubtitle : UILabel = {
        let label = UILabel()
        label.textColor = ColorHelper.mainColor
        label.font = UIFontHelper.qrResultSubtitleFont
        label.text = StringConstants.qrSuccessSubtitle
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var qrResultView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        return view
    }()
    
    var qrResultImage : UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "qrcode"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    

    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupView()
        setupTapGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        
        qrResultView.addSubview(qrResultImage)
        
        self.addSubview(qrResultTitle)
        self.addSubview(qrResultSubtitle)
        self.addSubview(qrResultView)

        
    }
    
    override func layoutSubviews() {
        let screenSize = UIScreen.main.bounds.size
        NSLayoutConstraint.activate([
            qrResultView.widthAnchor.constraint(equalToConstant: screenSize.width * 0.5 - 40 ),
            qrResultView.heightAnchor.constraint(equalToConstant: screenSize.height * 0.4 - 140),
            qrResultView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            qrResultView.topAnchor.constraint(equalTo: self.topAnchor, constant: 70),
            
            qrResultImage.widthAnchor.constraint(equalToConstant: screenSize.width * 0.5 - 60 ),
            qrResultImage.heightAnchor.constraint(equalToConstant: screenSize.height * 0.4 - 160),
            qrResultImage.centerXAnchor.constraint(equalTo: qrResultView.centerXAnchor),
            qrResultImage.centerYAnchor.constraint(equalTo: qrResultView.centerYAnchor),
            
            qrResultTitle.widthAnchor.constraint(equalToConstant: screenSize.width / 2 - 20),
            qrResultTitle.heightAnchor.constraint(equalToConstant: 20),
            qrResultTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            qrResultTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            
            qrResultSubtitle.widthAnchor.constraint(equalToConstant: screenSize.width / 2 - 20),
            qrResultSubtitle.heightAnchor.constraint(equalToConstant: screenSize.height * 0.2),
            qrResultSubtitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15),
            qrResultSubtitle.topAnchor.constraint(equalTo: qrResultTitle.bottomAnchor, constant: -50),
            
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
        // İlk olarak overlay'ı göster
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95) // Biraz küçült
        }) { _ in
            // Geri eski haline getir
            UIView.animate(withDuration: 0.2, animations: {
                self.transform = .identity // Orijinal boyutuna dön
            })
        }
    }


}
