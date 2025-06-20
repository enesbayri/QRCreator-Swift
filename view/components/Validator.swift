//
//  ValidateView.swift
//  QRCreator
//
//  Created by Enes Bayri on 19.06.2025.
//


import UIKit

class Validator {
    static func validateTexts(size:String , data: String, view: UIViewController) -> Bool {
        if data.isEmpty {
            let error = UIAlertController(title: "Alert", message: "Content cannot be empty", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            error.addAction(action)
            view.present(error, animated: true, completion: nil)
            return false
        }else if size.isEmpty {
            let error = UIAlertController(title: "Alert", message: "Size cannot be empty", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            error.addAction(action)
            view.present(error, animated: true, completion: nil)
            return false
        }else{
            if let _ = Int(size) {
                return true
            } else {
                let error = UIAlertController(title: "Alert", message: "Size must be a number. For example, for a size of '120x120', enter '120'.", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                error.addAction(action)
                view.present(error, animated: true, completion: nil)
                return false
            }
        }
    }
}
