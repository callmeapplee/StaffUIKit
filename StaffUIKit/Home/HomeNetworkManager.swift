//
//  HomeNetworkManager.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 14/02/23.
//

import Foundation
import Alamofire
class HomeNetworkManager{
    let baseURL = "http://94.228.124.133/api/"
    func getData<T>(URL tempUrl:String, typeData: T) -> T {
        let url = baseURL + tempUrl
        AF.request(url).responseDecodable { response in
            switch response.result{
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }
    }
}
