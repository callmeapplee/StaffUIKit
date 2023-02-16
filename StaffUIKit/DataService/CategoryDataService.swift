//
//  CategoryDataService.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 16/02/23.
//

import Foundation
import UIKit
import CoreData
class CategoryDataService{
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    static var categoriesDB:[CategoryDB] = []
    func fetchingData(){
        let fetchRequest:NSFetchRequest<CategoryDB> = CategoryDB.fetchRequest()
        do {
            CategoryDataService.categoriesDB = try CategoryDataService.context.fetch(fetchRequest)
        }
        catch{
            print(error.localizedDescription)
        }
    }
    func add(logoURl:String,id:Int,logo:Data){
        let entity = NSEntityDescription.entity(forEntityName: "CategoryDB", in: CategoryDataService.context)
        let categoryDBObject = NSManagedObject(entity: entity!, insertInto: CategoryDataService.context) as! CategoryDB
        categoryDBObject.logoURL = logoURl
        categoryDBObject.id = Int64(id)
        categoryDBObject.logo = logo
        fetchingData()
        save()
        
    }
    func delete(categoryDB:CategoryDB){
        CategoryDataService.context.delete(categoryDB)
        save()
    }
    func save(){
        do {
            try CategoryDataService.context.save()
        }
        catch{
            print(error.localizedDescription)
        }
    }
}
