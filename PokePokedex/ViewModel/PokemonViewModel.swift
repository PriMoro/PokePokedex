//
//  PokemonViewModel.swift
//  PokePokedex
//
//  Created by Priscila Moro on 23/12/2022.
//

import Foundation
import SwiftUI

class PokemonViewModel: ObservableObject {
    
    @Published var pokemon = [Pokemon]()
    @Published var filteredPokemon = [Pokemon]()
    @Published var pokemonList = [Demo]()
    
    @Published var arrayPokesFav: [Pokemon] = []
    
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
            guard let data = data else { return }
            let pokemon: [Pokemon]
            do {
                // Converts [Pokemon?] -> [Pokemon]
                pokemon = (try JSONDecoder().decode([Pokemon?].self, from: data)).compactMap { $0 }
            } catch {
                pokemon = []
                print(error.localizedDescription)
            }
            //print("pokemons here: \(pokemon)")
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }.resume()
    }
    
    func savePoke(pokemon: Binding<Pokemon>) {
        pokemon.wrappedValue.isFavorite.toggle()
        print("change to: \(pokemon.wrappedValue.isFavorite)")
        Favorites.instance.arrayPokesFavoritesDB.append(pokemon.wrappedValue)
        //print(pokemon)
    }
    
    func pokemonIsFavorite(pokemon: Pokemon) -> Bool {
        return Favorites.instance.arrayPokesFavoritesDB.filter({ $0.name.lowercased() == pokemon.name.lowercased() }).first != nil ? true : false
   }
    
}
