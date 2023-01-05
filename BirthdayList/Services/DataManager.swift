//
//  DataManager.swift
//  BirthdayList
//
//  Created by DevTechie on 12/29/22.
//

import CoreData
import Foundation
import UIKit

final class DataManager {
    var managedContext: NSManagedObjectContext
    
    static let shared = DataManager(managedContext: NSManagedObjectContext.current)
    
    init(managedContext: NSManagedObjectContext) {
        self.managedContext = managedContext
    }
    
    func getBirthdays() -> [Birthday] {
        var birthdays = [Birthday]()
        
        let bdRequest: NSFetchRequest<Birthday> = Birthday.fetchRequest()
        
        do {
            birthdays = try managedContext.fetch(bdRequest)
        } catch {
            print(error)
        }
        
        return birthdays
    }
    
    func saveBirthday(id: UUID, name: String, date: Date) {
        let birthday = Birthday(context: managedContext)
        birthday.id = id
        birthday.name = name
        birthday.date = date
        
        do {
            try managedContext.save()
        } catch {
            print(error)
        }
    }
    
    func updateBirthday(id: UUID, name: String, date: Date) {
        let fetchRequest: NSFetchRequest<Birthday> = Birthday.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "id=%@", id.uuidString)
        
        do {
            let bday = try managedContext.fetch(fetchRequest).first
            bday?.date = date
            bday?.name = name
            
            try managedContext.save()
        } catch {
            print(error)
        }
    }
    
    func removeBirthday(id: UUID) {
        let fetchRequest: NSFetchRequest<Birthday> = Birthday.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "id=%@", id.uuidString)
        
        do {
            let bdays = try managedContext.fetch(fetchRequest)
            
            for bday in bdays {
                managedContext.delete(bday)
            }
            
            try managedContext.save()
        } catch {
            print(error)
        }
    }
}
