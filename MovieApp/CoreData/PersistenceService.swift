//
//  PersistenceService.swift
//  MovieApp
//
//  Created by Mohamad Naufal Nafian on 17/12/20.
//

import UIKit
import CoreData

class PersistenceService {
    
    private init() {}
    
    static var context: NSManagedObjectContext {
        return persistenceContainer.viewContext
    }
    
    static var persistenceContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "MovieApp")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    static func saveContext() {
        let context = persistenceContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("SAVED")
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

