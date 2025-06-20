//
//  ViewController.swift
//  QRCreator
//
//  Created by Enes Bayri on 15.06.2025.
//

import UIKit
import SDWebImage

class ViewController: UIViewController , QRViewModelOutput {
    
    
    var topContainer : TopContainerView = TopContainerView()
    
    var bottomContainer : QRResultView = QRResultView()
    
    var qrCreateButton : QRCreateButton = QRCreateButton()
    
    var defaultTitle : DefaultTitle = DefaultTitle()
    
    var qrViewModel : QRViewModel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        qrViewModel = QRViewModel(qrService: QRService())
        topContainer.homeView = self
        qrViewModel.viewOutput = self
        setupViews()
        setupConstraints()
        addGradientBackground()
    }
    
    
    
    func setupViews() {
        
        qrCreateButton.onTap = onCreateTap
        bottomContainer.isHidden = true
        bottomContainer.onTap = onDetailsTap
        self.view.addSubview(bottomContainer)
        self.view.addSubview(topContainer)
        self.view.addSubview(qrCreateButton)
        self.view.addSubview(defaultTitle)
    }
    
    func onCreateTap() {
        
        
        let size = topContainer.sizeField.text ?? ""
        let data = topContainer.contentField.text ?? ""
        
        let isValidateContents = Validator.validateTexts(size: size, data: data, view: self)
        
        if isValidateContents {
            self.defaultTitle.isHidden = true
            self.bottomContainer.isHidden = false
            qrViewModel.createQR(size: size, data: data)
        }else {
            self.defaultTitle.isHidden = false
            self.bottomContainer.isHidden = true
            defaultTitle.titleLabel.text = StringConstants.errorTitle
        }
    }
    
    func onDetailsTap() {
        performSegue(withIdentifier: "DetailsVC", sender: nil)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        qrCreateButton.layer.cornerRadius = qrCreateButton.bounds.width / 2
        qrCreateButton.clipsToBounds = true
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
    
    
    func setupConstraints() {

        NSLayoutConstraint.activate([
            topContainer.topAnchor.constraint(equalTo: view.topAnchor),
            topContainer.widthAnchor.constraint(equalTo: view.widthAnchor),
            topContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            qrCreateButton.widthAnchor.constraint(equalToConstant: 140),
            qrCreateButton.heightAnchor.constraint(equalToConstant: 140),
            qrCreateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            qrCreateButton.centerYAnchor.constraint(equalTo: view.centerYAnchor , constant: -20),
            
            
            bottomContainer.widthAnchor.constraint(equalToConstant: view.bounds.width),
            bottomContainer.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.4),
            bottomContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            defaultTitle.widthAnchor.constraint(equalToConstant: view.bounds.width),
            defaultTitle.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.4),
            defaultTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            defaultTitle.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func getQRImage(qr: QR) {
        self.bottomContainer.qrResultImage.sd_setImage(with: URL(string: qr.url), placeholderImage: UIImage(systemName: "qrcode"), context: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailsVC" {
            let detailsVC = segue.destination as! DetailsVC
            detailsVC.qr = self.qrViewModel.qr
            self.defaultTitle.isHidden = false
            self.bottomContainer.isHidden = true
            defaultTitle.titleLabel.text = StringConstants.startingTitle
            topContainer.sizeField.text = ""
            topContainer.contentField.text = ""
            
        }
    }


}

