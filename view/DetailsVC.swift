//
//  DetailsVC.swift
//  QRCreator
//
//  Created by Enes Bayri on 16.06.2025.
//

import UIKit

class DetailsVC: UIViewController {
    
    var downloadViewModel: ImageDownloadViewModel!
    
    var qr : QR!
    
 
    var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Here is your QR!"
        label.textColor = ColorHelper.mainColor
        label.font = UIFontHelper.detailsPageTitleFont
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    var backButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.left",withConfiguration: UIImage.SymbolConfiguration(pointSize: 36, weight: .medium)), for: .normal)
        button.tintColor = ColorHelper.mainColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var subtitleLabel : UILabel = {
        let label = UILabel()
        label.text = "You can fit everything into this code, even the world..."
        label.numberOfLines = 2
        label.textColor = ColorHelper.mainColor
        label.font = UIFontHelper.detailsPageSubtitleFont
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        return label
    }()
    
    var qrImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.layer.cornerRadius = 32
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var qrDownloadButton : IconTextButtonView = IconTextButtonView()

    override func viewDidLoad() {
        super.viewDidLoad()
        downloadViewModel = ImageDownloadViewModel(downloadService: ImageDownloadService())
        qrImageView.sd_setImage(with: URL(string: qr.url), placeholderImage: UIImage(systemName: "qrcode"), context: nil)
        qrDownloadButton.onTap = downloadImage
        setupView()
        addGradientBackground()
        
    }
    
    func setupView() {
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        view.addSubview(titleLabel)
        view.addSubview(qrImageView)
        view.addSubview(subtitleLabel)
        view.addSubview(qrDownloadButton)
        view.addSubview(backButton)
    }
    
    @objc func backButtonTapped() {
        dismiss(animated: true)
    }
    
    private func addGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            ColorHelper.mainColor.withAlphaComponent(0.5).cgColor,
            ColorHelper.bgColor.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height * 0.1),
            titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            qrImageView.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.5),
            qrImageView.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.8),
            qrImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            qrImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: view.bounds.height * 0.05),
            
            subtitleLabel.topAnchor.constraint(equalTo: qrImageView.bottomAnchor, constant: view.bounds.height * 0.02),
            subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subtitleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            subtitleLabel.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.1),
            
            qrDownloadButton.widthAnchor.constraint(equalToConstant: view.bounds.width * 0.4),
            qrDownloadButton.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.07),
            qrDownloadButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view.bounds.width * 0.1),
            qrDownloadButton.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: view.bounds.height * 0.01),
            
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor , constant: 20),
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height * 0.05),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
    func downloadImage(){
        downloadViewModel.downloadImage(url: qr.url, view: self)
    }
    

    

}
