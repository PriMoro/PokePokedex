//
//  DemoView2.swift
//  PokePokedex
//
//  Created by Priscila Moro on 21/12/2022.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView().tabItem {
                Image(systemName: "house")
            }
            SearchBar().tabItem {
                Image(systemName: "magnifyingglass")
            }
            FavoritesView().tabItem {
                Image(systemName: "star")
            }
        }
    }
}

struct DemoView2_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
