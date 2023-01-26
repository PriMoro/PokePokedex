//
//  SearchBar.swift
//  PokePokedex
//
//  Created by Priscila Moro on 22/12/2022.
//

import SwiftUI
import Kingfisher

struct SearchBar: View {
    
    @ObservedObject var viewModel = PokemonViewModel()
    
    @State var searchText: String = ""
    
    var grid = [GridItem(.flexible()), GridItem(.flexible())]
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var filteredPokemon: [Pokemon] {
        if searchText == "" { return viewModel.pokemon }
        return viewModel.pokemon.filter {
            $0.name.lowercased().contains(searchText.lowercased()) || $0.type.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    LazyVGrid(columns: grid, spacing: 16) {
                        if searchText != "" {
                            ForEach(filteredPokemon) { poke in
                                NavigationLink(destination: PokemonDetailView(pokemon: poke)) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 20)
                                            .foregroundColor(poke.typeColor)
                                        VStack {
                                            HStack {
                                                Text(poke.name.capitalized).font(.title).foregroundColor(.white)
                                                StarView(name: poke.name.lowercased(), viewContext: viewContext)
                                            }
                                            HStack {
                                                ZStack {
                                                    RoundedRectangle(cornerRadius: 15)
                                                        .frame(width: 60, height: 50)
                                                        .foregroundColor(poke.typeColor.opacity(0.1))
                                                    
                                                    Text(poke.type.capitalized).italic().foregroundColor(.white)
                                                }
                                                KFImage(URL(string: poke.imageUrl))
                                                    .interpolation(.none)
                                                    .resizable()
                                                    .frame(width: 100, height: 100)
                                            }
                                        }
                                        
                                    }.padding([.leading, .trailing], 5)
                                }
                            }
                        }
                        else {
                            EmptyView()
                        }
                    }
                }
            }
            .navigationTitle("Search Pokemons")
        }
        .searchable(text: $searchText, prompt: "Search Pokemons by name or by type")
        .onAppear {
            viewModel.getPokemon()
            
        }
    }
    
    func searchBarOnlyLetters(testString: String) -> Bool {
        return true
    }
    
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
