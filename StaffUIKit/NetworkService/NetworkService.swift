//
//  NetworkService.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 15/02/23.
//

import Foundation
import Alamofire
class NetworkService{
    
    static func getImage(pathURL:String, completion: @escaping(Data?)->()){
        let url = "http://94.228.124.133/\(pathURL)"
        AF.request(url).responseData { response in
            switch response.result{
            case .success(let data):
                completion(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
