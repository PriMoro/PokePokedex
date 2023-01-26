//
//  PokemonViewModel.swift
//  PokePokedex
//
//  Created by Priscila Moro on 23/12/2022.
//

import Foundation
import SwiftUI
import CoreData

class PokemonViewModel: ObservableObject {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Published var pokemon = [Pokemon]()
    
    let MOCK_POKEMON = Pokemon(
        id: 1,
        name: "Bulbasaur",
        imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334",
        description: "small",
        height: 49,
        weight: 52,
        attack: 10,
        defense: 98,
        type: "poison")
    
    func getPokemon() {
        guard let url = URL(string: "https://pokedex-bb36f.firebaseio.com/pokemon.json") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data?.removeNullFrom(string: "null,") else { return }
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else { return }
            print(pokemon)
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }.resume()
    }
    

}
