//
//  StarView.swift
//  PokePokedex
//
//  Created by Priscila Moro on 25/01/2023.
//

import SwiftUI
import CoreData

struct StarView: View {
    
    var name: String
    var viewContext: NSManagedObjectContext
    @State var matches: [PokemonDB]?
    
    var body: some View {
        return VStack {
            if matches == [] {
                EmptyView()
            } else {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        .task {
            let fetchRequest: NSFetchRequest<PokemonDB> = PokemonDB.fetchRequest()
            fetchRequest.entity = PokemonDB.entity()
            fetchRequest.predicate = NSPredicate(
                format: "name CONTAINS %@", name.lowercased()
            )
            matches = try? viewContext.fetch(fetchRequest)
        }
    }
}

