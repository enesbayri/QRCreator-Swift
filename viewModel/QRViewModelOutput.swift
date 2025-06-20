//
//  QRViewModelOutput.swift
//  QRCreator
//
//  Created by Enes Bayri on 19.06.2025.
//


protocol QRViewModelOutput : AnyObject  {
    func getQRImage(qr : QR) -> Void
}
