//
//  FavoriteButton.swift
//  PokePokedex
//
//  Created by Priscila Moro on 21/12/2022.
//

import SwiftUI

struct FavoriteButton: View {
    
    var arrayPokesFav: [Pokemon] = []
        
    @ObservedObject var viewmodel = PokemonViewModel()
    
    @State var isSet: Bool = false
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Image(systemName: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }

    }
    
    
     
    
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton()
    }
}
