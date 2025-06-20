//
//  UrlService.swift
//  QRCreator
//
//  Created by Enes Bayri on 19.06.2025.
//

struct DecodeService {
    static func DecodeData(size: String, data: String) -> String{
 
        let decodeSize = "size=\(size)x\(size)"
        let createDataString = "data=\(data)"
        let completedString = "\(decodeSize)&\(createDataString)"
                
        var decodedData = ""
                
        for char in completedString {
            if char == " " {
                decodedData += "+"
            } else if char == "&" || char == "=" {
                decodedData += String(char)
            } else {
                if let decodedChar = String(char).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                    decodedData += decodedChar
                }
            }
        }
                
        return decodedData
    }
}
