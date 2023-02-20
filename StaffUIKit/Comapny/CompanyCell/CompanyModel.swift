//
//  CompanyModel.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 17/02/23.
//

import Foundation

// MARK: - Cities
struct Company: Codable {
    let result: CompanyResult
    let response: CompanyResponse
}

// MARK: - Response
struct CompanyResponse: Codable {
    let currentPage: Int
    let data: [CompanyDatum]

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data
    }
}

// MARK: - Datum
struct CompanyDatum: Codable {
    var id, accountID: Int
    let name, logo:String
    let datumDescription: String?
    let categoryID, status: Int
    let startTime, endTime, createdAt, updatedAt: String
    let numberOfVacancies: Int?
    let category: CompanyCategory

    enum CodingKeys: String, CodingKey {
        case id
        case accountID = "account_id"
        case name, logo
        case datumDescription = "description"
        case categoryID = "category_id"
        case status
        case startTime = "start_time"
        case endTime = "end_time"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case numberOfVacancies = "number_of_vacancies"
        case category
    }
}

// MARK: - Category
struct CompanyCategory: Codable {
    let id: Int
    let name, icon: String
    let status: Int
}

// MARK: - Link
struct CompanyLink: Codable {
    let url: String?
    let label: String
    let active: Bool
}

// MARK: - Result
struct CompanyResult: Codable {
    let id, errorCode: Int
    let errorMessage: String

    enum CodingKeys: String, CodingKey {
        case id
        case errorCode = "error_code"
        case errorMessage = "error_message"
    }
}



