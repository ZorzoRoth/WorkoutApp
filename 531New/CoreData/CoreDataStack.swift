//
//  CoreDataStack.swift
//  531New
//
//  Created by Zoltan Puchovsky on 21/07/2019.
//  Copyright © 2019 Zoltan Puchovsky. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    var container: NSPersistentContainer {
        let container = NSPersistentContainer(name: "Todos")
        container.loadPersistentStores { (description, error) in
            guard error == nil else {
                print("Error: \(error!)")
                return
            }
        }
        
        return container
    }
    
    var managedContext: NSManagedObjectContext {
        return container.viewContext
    }
}
