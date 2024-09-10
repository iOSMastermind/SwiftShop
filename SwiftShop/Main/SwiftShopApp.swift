//
//  SwiftShopApp.swift
//  SwiftShop
//
//  Created by Jinu on 09/09/2024.
//

import SwiftUI
import CoreData

@main
struct SwiftShopApp: App {
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SwiftShop")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        }
        return container
    }()
    
    var body: some Scene {
        WindowGroup {
            // Create the view model with the managed object context
            let viewModel = MainViewModel(context: persistentContainer.viewContext)
            
            // Pass the view model to MainView
            CustomTabView(viewModel: viewModel)
                .environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
}
