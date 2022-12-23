//
//  PokemonDetailStat.swift
//  PokePokedex
//
//  Created by Priscila Moro on 19/12/2022.
//

import SwiftUI

struct PokemonDetailStat: View {
    
    var pokemon: Pokemon
    var statName: String
    var statColor: Color
    var statValue: Int
    
    var body: some View {
        Grid {
            GridRow {
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
}

struct PokemonDetailStat_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailStat(pokemon: PokemonViewModel().MOCK_POKEMON, statName: "Atk", statColor: .blue, statValue: 55)
    }
}

