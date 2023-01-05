//
//  PersistenceController.swift
//  BirthdayList
//
//  Created by DevTechie on 12/29/22.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "BirthdayListApp")
        
        container.loadPersistentStores { _, error in
            if let error = error as? NSError {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}

extension NSManagedObjectContext {
    static var current: NSManagedObjectContext {
        PersistenceController.shared.container.viewContext
    }
}
