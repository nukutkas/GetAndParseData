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
    
    static func sendRequest(url: String, completion: @escaping (_ courses: [Course])->()) {
        
        guard let url = URL(string: url) else { return }
        
        AF.request(url, method: .get).validate().responseJSON { (response) in
             
            switch response.result {
            
            case .success(let value):
                
                print(value)
                
                guard let arrayOfItems = value as? Array<[String: Any]> else { return }
                
                var courses = [Course]()
                
                for field in arrayOfItems {
                    let course = Course(id: field["id"] as? Int,
                                        name: field["name"] as? String,
                                        link: field["link"] as? String,
                                        imageUrl: field["imageUrl"] as? String,
                                        numberOfLessons: field["number_of_lessons"] as? Int,
                                        numberOfTests: field["number_of_tests"] as? Int)
                    courses.append(course)
                }
                
                completion(courses)
    
    
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
