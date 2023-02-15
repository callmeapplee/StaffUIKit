//
//  HomeNetworkManager.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 14/02/23.
//

import Foundation
import Alamofire
class HomeNetworkService{
    
    static func getHomeData(completion: @escaping(Home?)->()){
        var url = "\(Helper.baseURL)home?language_id=\(UserInfo.defaults.integer(forKey: "languageID"))&device=\(UIDevice.current.name)&platform=\(UIDevice.current.systemName)&platform_version=\(UIDevice.current.systemVersion)"
        url = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        AF.request(url,headers: Helper.header).responseDecodable(of: Home.self) {response in
            switch response.result{
            case .success(let home):
                completion(home)
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
    }
    static func getActiveVacancyData(page:String,perPage:String,completion: @escaping(Vacancy?)->()){
        var url = "\(Helper.baseURL)active-vacancies?language_id=\(UserInfo.defaults.integer(forKey: "languageID"))&page =\(page)&per_page=\(perPage)&device=\(UIDevice.current.name)&platform=\(UIDevice.current.systemName)&platform_version=\(UIDevice.current.systemVersion)"
        url = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        AF.request(url,headers: Helper.header).responseDecodable(of: Vacancy.self) {response in
            switch response.result{
            case .success(let home):
                completion(home)
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
    }
}
