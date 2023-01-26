//
//  PokemonDetailStarView.swift
//  PokePokedex
//
//  Created by Priscila Moro on 26/01/2023.
//

import SwiftUI
import CoreData


struct PokemonDetailStarView: View {
    
    @State var isSet: Bool
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: PokemonDB.entity(),
                  sortDescriptors: [])
    private var pokemons: FetchedResults<PokemonDB>
    @State var matches: [PokemonDB]?
    @State var pokemon: Pokemon
    
    var body: some View {
        VStack {
            Button {
                isSet = checkPokeIsSaved(name: pokemon.name, type: pokemon.type, imageUrl: pokemon.imageUrl)
            } label: {
                Image(systemName: isSet ? "star.fill" : "star")
                    .labelStyle(.iconOnly)
                    .foregroundColor(isSet ? .yellow : .gray)
            }
        }
        .task {
            let fetchRequest: NSFetchRequest<PokemonDB> = PokemonDB.fetchRequest()
            fetchRequest.entity = PokemonDB.entity()
            fetchRequest.predicate = NSPredicate(
                format: "name CONTAINS %@", pokemon.name.lowercased()
            )
            matches = try? viewContext.fetch(fetchRequest)
        }
    }
    func checkPokeIsSaved(name: String, type: String, imageUrl: String) -> Bool {
        let fetchRequest: NSFetchRequest<PokemonDB> = PokemonDB.fetchRequest()
        fetchRequest.entity = PokemonDB.entity()
        fetchRequest.predicate = NSPredicate(
            format: "name CONTAINS %@", name.lowercased()
        )
        matches = try? viewContext.fetch(fetchRequest)
        
        if matches == [] {
            addPokemon(name: name, type: type, imageUrl: imageUrl)
            return true
        } else {
            return false
        }
    }
    
    func addPokemon(name: String, type: String, imageUrl: String) {
        withAnimation {
            let pokemonfav = PokemonDB(context: viewContext)
            pokemonfav.name = name
            pokemonfav.type = type
            pokemonfav.imageUrl = imageUrl
            saveContext()
        }
    }
    func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("An error occured: \(error)")
        }
    }
}



