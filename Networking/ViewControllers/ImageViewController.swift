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
        activityIndicator.isHidden = true
        activityIndicator.hidesWhenStopped = true
        fetchImage()
        completedLabel.isHidden = true
        progressView.isHidden = true
    }
    
    func fetchImage() {
        
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        NetworkManager.downloadImage(url: url) { (image) in
            self.activityIndicator.stopAnimating()
            self.imageView.image = image
        }
    }
    func fetchDataWithAlamofire() {
        AF.request(url).responseData { (responseData) in
            switch responseData.result {
            case .success(let data):
                guard let image = UIImage(data: data) else { return }
                
                self.activityIndicator.stopAnimating()
                self.imageView.image = image

            case .failure(let error):
                print(error)
            }
        }
    }
    func downloadImageWithProgress() {
        
    }
}
