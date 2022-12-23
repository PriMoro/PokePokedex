//
//  PokemonDetailImage.swift
//  PokePokedex
//
//  Created by Priscila Moro on 19/12/2022.
//

import SwiftUI
import Kingfisher

struct PokemonDetailImage: View {
    var image: KFImage
    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 200)
            .clipShape(Rectangle())
            //.overlay(Circle().stroke(Color.white, lineWidth: 5))
            //.background(Circle().foregroundColor(.white))
            .shadow(radius: 5)
    }
}

struct PokemonDetailImage_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailImage(image: KFImage(URL(string: PokemonViewModel().MOCK_POKEMON.imageUrl)))
    }
}
