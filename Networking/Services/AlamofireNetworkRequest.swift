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
             
            guard let statusCode = response.response?.statusCode else { return }
            
            print("statusCode: ", statusCode)
            
            if (200..<300).contains(statusCode) {
                let value = response.value
                print("value: ", value ?? "nil")
            } else {
                let error = response.error
                print(error ?? "error")
            }
        }
    }
}
