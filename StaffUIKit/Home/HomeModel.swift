// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let cities = try? newJSONDecoder().decode(Cities.self, from: jsonData)

import Foundation

// MARK: - Cities
struct Home: Codable {
    let result: HomeResult
    let response: HomeResponse
}

// MARK: - Response
struct HomeResponse: Codable {
    let topCategories: [TopCategory]
    let topCompanies: [TopCompany]
    let cities: [City]
    let scheduleTypes: [ScheduleType]
    let experiences: [Experience]

    enum CodingKeys: String, CodingKey {
        case topCategories = "top_categories"
        case topCompanies = "top_companies"
        case cities
        case scheduleTypes = "schedule_types"
        case experiences
    }
}

// MARK: - City
struct City: Codable {
    let id: Int
    let nameTj, nameRu, nameEn: String
    let status: Int
    enum CodingKeys: String, CodingKey {
        case id
        case nameTj = "name_tj"
        case nameRu = "name_ru"
        case nameEn = "name_en"
        case status
    }
}

// MARK: - Experience
struct Experience: Codable {
    let id: Int
    let name: String
}

// MARK: - ScheduleType
struct ScheduleType: Codable {
    let id: Int
    let name: String
    let status: Int
}

// MARK: - TopCategory
struct TopCategory: Codable {
    let id: Int
    let name, icon: String
}

// MARK: - TopCompany
struct TopCompany: Codable {
    let id: Int
    let name, logo: String
    //let logo: HomeLogo
}

enum HomeLogo: String, Codable {
    case storageEmployersTcellJpg = "/storage/employers/tcell.jpg"
}

// MARK: - Result
struct HomeResult: Codable {
    let id, errorCode: Int
    let errorMessage: String

    enum CodingKeys: String, CodingKey {
        case id
        case errorCode = "error_code"
        case errorMessage = "error_message"
    }
}
