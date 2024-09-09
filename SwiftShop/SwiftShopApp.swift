//
//  SwiftShopApp.swift
//  SwiftShop
//
//  Created by Jinu on 09/09/2024.
//

import SwiftUI

@main
struct SwiftShopApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
