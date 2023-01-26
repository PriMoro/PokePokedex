//
//  PokePokedexApp.swift
//  PokePokedex
//
//  Created by Priscila Moro on 19/12/2022.
//

import SwiftUI

@main
struct PokePokedexApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
