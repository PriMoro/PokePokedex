//
//  PokemonDetailStatTotal.swift
//  PokePokedex
//
//  Created by Priscila Moro on 20/12/2022.
//

import SwiftUI

struct PokemonDetailStatTotal: View {
    
    var pokemon: Pokemon
    var statName: String
    var statColor: Color
    var statValue: Int
    
    var body: some View {
        HStack {
            Text(statName)
                .font(.system(.body, design: .monospaced))
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.gray)
                    .frame(width: 200, height: 20)
                
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(statColor)
                    .frame(width: statValue <= 100 ? 200 * (CGFloat(statValue) / 100) : 200, height: 20)
            }
            
            Text("\(statValue)%")
                .font(.system(.body, design: .monospaced))
        }
    }
}

struct PokemonDetailStatTotal_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailStatTotal(pokemon: PokemonViewModel().MOCK_POKEMON, statName: "Atk", statColor: .blue, statValue: 55)
    }
}
