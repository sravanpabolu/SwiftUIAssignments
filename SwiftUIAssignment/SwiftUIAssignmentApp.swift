//
//  SwiftUIAssignmentApp.swift
//  SwiftUIAssignment
//
//  Created by Sravan Kumar Pabolu on 18/05/22.
//

import SwiftUI

@main
struct SwiftUIAssignmentApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
//            SBICardLoginView()
//            TopSongsView()
//            TransactionsListView()
            
            let viewContext = CoreDataManager.shared.persistentContainer.viewContext
            SimpleTodoView().environment(\.managedObjectContext, viewContext)
        }
    }
}
