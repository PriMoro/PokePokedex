//
//  PokemonDetailDescription.swift
//  PokePokedex
//
//  Created by Priscila Moro on 20/12/2022.
//

import SwiftUI

struct PokemonDetailDescription: View {
    
    var pokemon: Pokemon
    
    var body: some View {
        VStack {
            Text(pokemon.description.replacingOccurrences(of: "\n", with: ""))
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding([.leading, .trailing])
        }
    }
}

struct PokemonDetailDescription_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailDescription(pokemon: PokemonViewModel().MOCK_POKEMON)
    }
}
