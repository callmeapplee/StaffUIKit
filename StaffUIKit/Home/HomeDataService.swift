//
//  HomeDataService.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 15/02/23.
//

import Foundation
import UIKit
import CoreData
class HomeDataService{
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    static var vacanciesDB:[VacancyDB] = []
    func fetchingData(){
        let fetchRequest:NSFetchRequest<VacancyDB> = VacancyDB.fetchRequest()
        do {
            HomeDataService.vacanciesDB = try HomeDataService.context.fetch(fetchRequest)
        }
        catch{
            print(error.localizedDescription)
        }
    }
    func add(logoURl:String,id:Int,logo:Data){
        let entity = NSEntityDescription.entity(forEntityName: "VacancyDB", in: HomeDataService.context)
        let vacancyDBObject = NSManagedObject(entity: entity!, insertInto: HomeDataService.context) as! VacancyDB
        vacancyDBObject.logoURL = logoURl
        vacancyDBObject.id = Int64(id)
        vacancyDBObject.logo = logo
        fetchingData()
        save()
        
    }
    func delete(vacancyDB:VacancyDB){
        HomeDataService.context.delete(vacancyDB)
        save()
    }
    func save(){
        do {
            try HomeDataService.context.save()
        }
        catch{
            print(error.localizedDescription)
        }
    }
}
