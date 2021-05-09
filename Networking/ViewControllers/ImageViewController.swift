//
//  ImageViewController.swift
//  Networking
//
//  Created by Татьяна Кочетова on 03.05.2021.
//  Copyright © 2021 Nikita Kochetov. All rights reserved.
//

import UIKit
import Alamofire

class ImageViewController: UIViewController {
    
    private let url = "https://applelives.com/wp-content/uploads/2016/03/iPhone-SE-11.jpeg"
    private let largeImageUrl = "https://i.imgur.com/3416rvI.jpg"
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var completedLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        completedLabel.isHidden = true
        progressView.isHidden = true
    }
    
    func fetchImage() {
        
        NetworkManager.downloadImage(url: url) { (image) in
            self.imageView.image = image
        }
    }
    func fetchDataWithAlamofire() {
        AlamoFireNetworkRequest.downloadImage(url: url) { (image) in
            
            self.activityIndicator.stopAnimating()
            self.imageView.image = image
        }
    }
    func downloadImageWithProgress() {
        AlamoFireNetworkRequest.onProgress = { progress in
            self.progressView.isHidden = false
            self.progressView.progress = Float(progress)
        }
        
        AlamoFireNetworkRequest.completed = { completed in
            self.completedLabel.isHidden = false
            self.completedLabel.text = completed
        }
        
        AlamoFireNetworkRequest.downloadImageWithProgress(url: largeImageUrl) { (image) in
            self.activityIndicator.stopAnimating()
            self.completedLabel.isHidden = true
            self.progressView.isHidden = true
            self.imageView.image = image
        }
    }
}
