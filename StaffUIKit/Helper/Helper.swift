//
//  Helper.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 14/02/23.
//

import Foundation
import UIKit
import Alamofire

class Helper{
    static let baseURL = "http://94.228.124.133/api/"
    static let platform = "device=\(UIDevice.current.name)&platform=\(UIDevice.current.systemName)&platform_version=\(UIDevice.current.systemVersion)"
    static var header:HTTPHeaders = ["Access-Token":"$2y$10$ervEvrbALg5WF84KTJIuu.OU4kjDfmPkGy9TXO3pBGC5SCeS6n/mK",
                                     "Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vOTQuMjI4LjEyNC4xMzMvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNjcxNzAzMTY3LCJleHAiOjQzNTIyNjMxNjcsIm5iZiI6MTY3MTcwMzE2NywianRpIjoiZkpXRGljMm9ycXJLSkxzeSIsInN1YiI6IjY0NSIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.XrwWUPYbVTyYPw4ex_ao46_eB0W_YGY3ZjjVycFBSGs"]
}

