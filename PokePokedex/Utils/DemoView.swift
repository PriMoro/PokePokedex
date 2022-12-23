//
//  DemoView.swift
//  PokePokedex
//
//  Created by Priscila Moro on 20/12/2022.
//

import SwiftUI
import Kingfisher

struct DemoView: View {
    
    @ObservedObject var viewmodel = PokemonViewModel()
    
    //var pokemon: Pokemon
    
    var body: some View {
        
        List(viewmodel.pokemonList, id: \.self) { poke in
            VStack {
                Text(poke.name)
                    .font(.largeTitle)
                HStack {
                    ForEach(poke.typeofpokemon , id: \.self) { type in
                        Text(type)
                    }
                }
            }
        }
        .onAppear {
            viewmodel.getPokemon()
            //print(viewmodel.pokemonList[1].typeofpokemon)
        }
    }
}



struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
