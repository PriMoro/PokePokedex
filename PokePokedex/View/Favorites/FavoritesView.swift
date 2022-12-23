//
//  Favorites.swift
//  PokePokedex
//
//  Created by Priscila Moro on 21/12/2022.
//

import SwiftUI
import Kingfisher

struct FavoritesView: View {
    
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(.white)
            VStack(alignment: .leading) {
                VStack {
                    Text("Favorites").font(.largeTitle).fontWeight(.heavy)
                        .padding()
                }
                List(arrayPokesFavoritesDB.indices, id: \.self) { poke in
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(arrayPokesFavoritesDB[poke].typeColor)
                        HStack {
                            Spacer()
                            Text(arrayPokesFavoritesDB[poke].name.capitalized)
                                .font(.title)
                                .foregroundColor(.white)
                            Spacer()
                            KFImage(URL(string: arrayPokesFavoritesDB[poke].imageUrl))
                                .resizable()
                                .frame(width: 100, height: 100)
                            Spacer()
                        }
                    }.padding()
                }
                .foregroundColor(.white)
            }
            .onAppear {
                print(arrayPokesFavoritesDB)
            }
        }
        
    }
    
}

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
