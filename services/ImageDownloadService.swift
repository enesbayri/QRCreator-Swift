//
//  ImageDownloadService.swift
//  QRCreator
//
//  Created by Enes Bayri on 20.06.2025.
//

import UIKit
import Photos


class ImageDownloadService {
    func downloadAndSaveImage(from urlString: String, viewController: UIViewController) {
        guard let url = URL(string: urlString) else {
            print("Geçersiz URL")
            return
        }
        
        // 1. Fotoğraf izni iste
        PHPhotoLibrary.requestAuthorization { status in
            switch status {
            case .authorized, .limited:
                // 2. Görseli indir
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data, let image = UIImage(data: data) {
                        // 3. Galeriye kaydet
                        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                        DispatchQueue.main.async {
                            let alert = UIAlertController(title: "Success", message: "The image downloaded.", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .default))
                            viewController.present(alert, animated: true)
                        }
                    } else {
                        DispatchQueue.main.async {
                            let alert = UIAlertController(title: "Permission Required", message: "You must grant permission to save to the gallery.", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .default))
                            viewController.present(alert, animated: true)
                        }
                    }
                }.resume()
                
            default:
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Permission Required", message: "You must grant permission to save to the gallery.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: { _ in
                        if let settingsUrl = URL(string: UIApplication.openSettingsURLString) {
                            UIApplication.shared.open(settingsUrl)
                        }
                    }))
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                    viewController.present(alert, animated: true)
                }
            }
        }
    }
}
