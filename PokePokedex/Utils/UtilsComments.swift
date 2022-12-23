//
//  UtilsComments.swift
//  PokePokedex
//
//  Created by Priscila Moro on 23/12/2022.
//

import Foundation

//func savePoke(pokemon: Pokemon) {
    //pokemon = pokemon.filter { $0.id == id }
    //pokemon.isFavorite
    //filteredPokemon = pokemon.filter({ $0.type == filter || $0.name == filter })
//    arrayPokesFav.append(pokemon)
//}

/*
 guard let urlDemo = URL(string: "https://gist.githubusercontent.com/mrcsxsiq/b94dbe9ab67147b642baa9109ce16e44/raw/97811a5df2df7304b5bc4fbb9ee018a0339b8a38/") else { return }
 URLSession.shared.dataTask(with: urlDemo) { data, response, error in
     guard let data = data else { return }
     guard let decodedApiPokemon = try? JSONDecoder().decode([Demo].self, from: data) else { return }
     //print(decodedApiPokemon)
     DispatchQueue.main.async {
         self.pokemonList = decodedApiPokemon
     }
 }.resume()
 */

/*guard let url2 = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else { return }

URLSession.shared.dataTask(with: url2) { data, response, error in
    guard let data = data else { return }
    guard let decoded = try? JSONDecoder().decode(ModelApi.self, from: data) else { return }
    print(decoded)
    DispatchQueue.main.async {
        self.pokemonList = decoded.results
    }
        //guard let allResults = try? JSONDecoder().decode(Results.self, from: data) else { return }
    
    //print(results)

    //guard let pokeinfo = try? JSONDecoder().decode(Pokemon, from: allResults.results) else { throw error}
    
    //guard let allPokes = try?
}.resume()
*/

//@ObservedObject var viewmodel = PokemonViewModel()

//var pokemon = PokemonViewModel().arrayPokesFav

//var filteredPokemons: [Pokemon] {
//   return viewmodel.pokemon.filter { poke in
//        poke.isFavorite
//    }
//}

//var arrayPokesFavoritesDB: [Pokemon]
