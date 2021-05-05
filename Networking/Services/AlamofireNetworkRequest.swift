//
//  AlamofireNetworkRequest.swift
//  Networking
//
//  Created by Татьяна Кочетова on 05.05.2021.
//  Copyright © 2021 Nikita Kochetov. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireNetworkRequest {
    
    static func sendRequest(url: String) {
        
        guard let url = URL(string: url) else { return }
        
        AF.request(url, method: .get).responseJSON { (response) in
            print(response)
        }
    }
}
