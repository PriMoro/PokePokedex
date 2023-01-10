//
//  Favorites.swift
//  PokePokedex
//
//  Created by Priscila Moro on 21/12/2022.
//

import SwiftUI
import Kingfisher

struct FavoritesView: View {
    
    @ObservedObject
    var favorites = Favorites.instance
    
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(.white)
            VStack(alignment: .leading) {
                VStack {
                    Text("Favorites").font(.largeTitle).fontWeight(.heavy)
                        .padding()
                }
                List(favorites.arrayPokesFavoritesDB.indices, id: \.self) { poke in
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(favorites.arrayPokesFavoritesDB[poke].typeColor)
                        HStack {
                            Spacer()
                            Text(favorites.arrayPokesFavoritesDB[poke].name.capitalized)
                                .font(.title)
                                .foregroundColor(.white)
                            Spacer()
                            KFImage(URL(string: favorites.arrayPokesFavoritesDB[poke].imageUrl))
                                .resizable()
                                .frame(width: 100, height: 100)
                            Spacer()
                        }
                    }.padding()
                }
                .foregroundColor(.white)
            }
            .onAppear {
                print(favorites.arrayPokesFavoritesDB)
            }
        }
        
    }
    
}

struct Favorites_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
