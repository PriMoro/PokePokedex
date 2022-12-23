//
//  PokemonDetailStats.swift
//  PokePokedex
//
//  Created by Priscila Moro on 19/12/2022.
//

import SwiftUI

struct PokemonDetailStats: View {
    
    var pokemon: Pokemon
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 7) {
            PokemonDetailStat(pokemon: pokemon, statName: "Atk", statColor: .blue, statValue: pokemon.attack)
            
            Divider().frame(height: 5)
            
            PokemonDetailStat(pokemon: pokemon, statName: "Def", statColor: .red, statValue: pokemon.defense)
            
            Divider().frame(height: 5)
            
            PokemonDetailStat(pokemon: pokemon, statName: "Hgt", statColor: .teal, statValue: pokemon.height)
            
            Divider().frame(height: 5)
            
            PokemonDetailStat(pokemon: pokemon, statName: "Wgt", statColor: .orange, statValue: pokemon.weight)
        }
    }
}

struct PokemonDetailStats_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailStats(pokemon: PokemonViewModel().MOCK_POKEMON)
    }
}
