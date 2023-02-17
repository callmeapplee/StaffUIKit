//
//  CompanyDataService.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 15/02/23.
//

import Foundation
import UIKit
import CoreData
class CompanyDataService{
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    static var companiesDB:[CompanyDB] = []
    func fetchingData(){
        let fetchRequest:NSFetchRequest<CompanyDB> = CompanyDB.fetchRequest()
        do {
            CompanyDataService.companiesDB = try CompanyDataService.context.fetch(fetchRequest)
        }
        catch{
            print(error.localizedDescription)
        }
    }
    func add(logoURl:String,id:Int,logo:Data){
        let entity = NSEntityDescription.entity(forEntityName: "CompanyDB", in: CompanyDataService.context)
        let companyDBObject = NSManagedObject(entity: entity!, insertInto: CompanyDataService.context) as! CompanyDB
        companyDBObject.logoURL = logoURl
        companyDBObject.id = Int64(id)
        companyDBObject.logo = logo
        fetchingData()
        save()
        
    }
    func delete(companyDB:CompanyDB){
        CompanyDataService.context.delete(companyDB)
        save()
    }
    func save(){
        do {
            try CompanyDataService.context.save()
        }
        catch{
            print(error.localizedDescription)
        }
    }
}
