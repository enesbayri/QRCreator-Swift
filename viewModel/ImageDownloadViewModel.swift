//
//  ImageDownloadViewModel.swift
//  QRCreator
//
//  Created by Enes Bayri on 20.06.2025.
//

import UIKit

class ImageDownloadViewModel {
    
    var downloadService: ImageDownloadService!
    
    init(downloadService: ImageDownloadService!) {
        self.downloadService = downloadService
    }
    
    func downloadImage(url:String ,view: UIViewController ) {
        downloadService.downloadAndSaveImage(from: url, viewController: view)
    }
}
