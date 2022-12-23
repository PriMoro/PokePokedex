//
//  PokemonDetailTabView.swift
//  PokePokedex
//
//  Created by Priscila Moro on 20/12/2022.
//

import SwiftUI

struct PokemonDetailTabView: View {
    
    var pokemon: Pokemon
    
    var body: some View {
        TabView {
            PokemonDetailDescription(pokemon: pokemon).tabItem {
                Text("About")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .font(.title2)
            }
            PokemonDetailStats(pokemon: pokemon).tabItem {
                Text("Stats")
            }
        }
    }
}

struct PokemonDetailTabView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailTabView(pokemon: PokemonViewModel().MOCK_POKEMON)
    }
}
