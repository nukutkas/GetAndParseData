//
//  ImageProperties.swift
//  Networking
//
//  Created by Татьяна Кочетова on 04.05.2021.
//  Copyright © 2021 Nikita Kochetov. All rights reserved.
//

import UIKit

struct ImageProperties {
    
    let key: String
    let data: Data
    
    init?(withImage image: UIImage, forKey key: String) {
        self.key = key
        guard let data = image.pngData() else { return nil }
        self.data = data
    }
    
}
