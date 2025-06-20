//
//  QRService.swift
//  QRCreator
//
//  Created by Enes Bayri on 19.06.2025.
//

class QRService : WebService {
    let apiUrl : String = "https://api.qrserver.com/v1/create-qr-code/?"
    func createQR(size: String, data: String) -> String {
        let createdQRUrl : String = apiUrl + DecodeService.DecodeData(size: size, data: data)
        return createdQRUrl
    }
}
