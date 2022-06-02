//
//  CoredataManager.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 02/06/22.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "TodoModel")
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Error loading Todo Model from database. \n Error: \(error)")
            }
        }
    }
}
