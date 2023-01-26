//
//  Favorites.swift
//  PokePokedex
//
//  Created by Priscila Moro on 21/12/2022.
//

import SwiftUI
import Kingfisher

struct FavoritesView: View {

    @ObservedObject var viewmodel = PokemonViewModel()
    
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(entity: PokemonDB.entity(),
                  sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)])
    
    private var pokemonsfavs: FetchedResults<PokemonDB>
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(pokemonsfavs) { poke in
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(chooseColor(type: poke.type))
                                HStack {
                                    Spacer()
                                    Text(poke.name?.capitalized ?? "Not found")
                                        .font(.title)
                                        .foregroundColor(.white)
                                    Spacer()
                                    KFImage(URL(string: poke.imageUrl ?? "Not found"))
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                    Spacer()
                                }
                            }.padding()
                        }
                    .onDelete(perform: deletePokemon)
                }
            }
                .navigationTitle("Favorites")
        }
    }
    func deletePokemon(offsets: IndexSet) {
        withAnimation {
            offsets.map { pokemonsfavs[$0] }.forEach(viewContext.delete)
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

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
