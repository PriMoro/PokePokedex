//
//  PokemonDetail.swift
//  PokePokedex
//
//  Created by Priscila Moro on 19/12/2022.
//

import SwiftUI
import Kingfisher

struct PokemonDetailView: View {
    
    @State var showAbout = true
    @State var showStats = false
    
    @ObservedObject var viewmodel = PokemonViewModel()
    
    @State var pokemon: Pokemon
    
    
    
    var pokemonIndex: Int {
        viewmodel.pokemon.firstIndex(where:  { $0.id == pokemon.id } )!
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(pokemon.backgroundColor), Color.white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    HStack {
                        VStack{
                            Text(pokemon.name.capitalized)
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .padding(.top, 40)
                                .foregroundColor(.white)
                            Text(pokemon.type.capitalized)
                                .foregroundColor(.white)
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .padding(.init(top: 10, leading: 24, bottom: 10, trailing: 24))
                                .background(Color(pokemon.backgroundColor))
                                .cornerRadius(20)
                        }
                        VStack(spacing: 10) {
                            Button(action: {
                                //print("before: \(pokemon.isFavorite)")
                                viewmodel.savePoke(pokemon: $pokemon)
                                //print("after = \(pokemon.isFavorite)")
                            }) {
                                Image(systemName: pokemon.isFavorite ? "star.fill" : "star")
                                    .labelStyle(.iconOnly)
                                    .foregroundColor(pokemon.isFavorite ? .yellow : .gray)
                            }
                            Text("# \(pokemon.id)")
                        }
                        .offset(x: 110, y: 15)
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                    }
                    .offset(x:-30, y:30)
                    .padding(.leading, -60)
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .frame(width: 300, height: 300)
                        .offset(y:20)
                }.padding(.top, -80)
                
                VStack {
                    Spacer()
                    VStack {
                        HStack {
                            Button(action: {
                                showAbout = true
                                showStats = false
                            }) {
                                Text(" About ")
                                    .foregroundColor(showAbout ? .white : .gray )
                                    .font(.title3)
                                    .background(
                                        GeometryReader { geometry in
                                            RoundedRectangle(cornerRadius: 15)
                                                .foregroundColor(showAbout ? pokemon.typeColor : .white)
                                                .frame(width: geometry.size.width * 1.1, height: geometry.size.height)
                                        }
                                    )
                            }
                            Divider().frame(width: 10, height: 50)
                                .foregroundColor(.gray)
                            Button(action: {
                                showAbout = false
                                showStats = true
                            }) {
                                Text(" Stats ")
                                    .foregroundColor(showStats ? .white : .gray )
                                    .font(.title3)
                                    .background(
                                        GeometryReader { geometry in
                                            RoundedRectangle(cornerRadius: 15)
                                                .foregroundColor(showStats ? pokemon.typeColor : .white)
                                                .frame(width: geometry.size.width * 1.1, height: geometry.size.height)
                                        }
                                        
                                    )
                            }
                        }
                        .padding(.bottom)
                        
                        VStack {
                            
                            if showAbout == true {
                                ZStack {
                                    Rectangle().foregroundColor(.white)
                                        .frame(height: 120)
                                    PokemonDetailDescription(pokemon: pokemon)
                                }
                            } else if showStats == true {
                                PokemonDetailStats(pokemon: pokemon)
                            }
                            
                        }
                        .background(Color.white)
                    }
                    Spacer()
                }
                .background(Color.white)
                .cornerRadius(20)
                .padding(.top, -30)
                .zIndex(-1)
            }
        }.navigationBarTitleDisplayMode(.inline)
    }
    
}



struct PokemonDetail_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: PokemonViewModel().MOCK_POKEMON)
    }
}
