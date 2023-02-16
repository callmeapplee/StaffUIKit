//
//  HomeDataService.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 15/02/23.
//

import Foundation
import UIKit
import CoreData
class VacancyDataService{
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    static var vacanciesDB:[VacancyDB] = []
    func fetchingData(){
        let fetchRequest:NSFetchRequest<VacancyDB> = VacancyDB.fetchRequest()
        do {
            VacancyDataService.vacanciesDB = try VacancyDataService.context.fetch(fetchRequest)
        }
        catch{
            print(error.localizedDescription)
        }
    }
    func add(logoURl:String,id:Int,logo:Data){
        let entity = NSEntityDescription.entity(forEntityName: "VacancyDB", in: VacancyDataService.context)
        let vacancyDBObject = NSManagedObject(entity: entity!, insertInto: VacancyDataService.context) as! VacancyDB
        vacancyDBObject.logoURL = logoURl
        vacancyDBObject.id = Int64(id)
        vacancyDBObject.logo = logo
        fetchingData()
        save()
        
    }
    func delete(vacancyDB:VacancyDB){
        VacancyDataService.context.delete(vacancyDB)
        save()
    }
    func save(){
        do {
            try VacancyDataService.context.save()
        }
        catch{
            print(error.localizedDescription)
        }
    }
}
