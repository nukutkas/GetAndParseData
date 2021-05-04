//
//  MainViewController.swift
//  Networking
//
//  Created by Татьяна Кочетова on 03.05.2021.
//  Copyright © 2021 Nikita Kochetov. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
private let url = "https://jsonplaceholder.typicode.com/posts"

class MainViewController: UICollectionViewController {
    
    let actions = ["Download Image", "GET", "POST", "Our Courses", "Upload Image"]



    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actions.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
    
        cell.label.text = actions[indexPath.row]
        return cell
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let action = actions[indexPath.row]
        
        switch action {
        case "Download Image":
            performSegue(withIdentifier: "ShowImage", sender: self)
        case "GET":
            NetworkManager.getRequest(url: url)
        case "POST":
            NetworkManager.postRequest(url: url)
        case "Our Courses":
            performSegue(withIdentifier: "OurCourses", sender: self)
        case "Upload Image":
            print("Upload Image")
        default:
            break
        }
    }
}
