//
//  QRViewModel.swift
//  QRCreator
//
//  Created by Enes Bayri on 19.06.2025.
//

class QRViewModel {
    var qrService : QRService!
    weak var viewOutput : QRViewModelOutput?
    
    var qr : QR!
    
    init(qrService: QRService!) {
        self.qrService = qrService
    }
    
    func createQR(size:String , data:String) {
        let qrUrl : String = qrService.createQR(size: size, data: data)
        let qr : QR = QR(size: size, data: data, url: qrUrl)
        self.qr = qr
        self.viewOutput?.getQRImage(qr: qr)
    }
}
