//
//  WebService.swift
//  QRCreator
//
//  Created by Enes Bayri on 19.06.2025.
//

protocol WebService {
    func createQR(size:String,data:String) -> String
}
