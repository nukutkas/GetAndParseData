//
//  WebsiteDescription.swift
//  Networking
//
//  Created by Татьяна Кочетова on 03.05.2021.
//  Copyright © 2021 Nikita Kochetov. All rights reserved.
//

import Foundation

struct WebsiteDescription: Decodable {
    
    let websiteDescription: String?
    let websiteName: String?
    let courses: [Course]?
    
}
