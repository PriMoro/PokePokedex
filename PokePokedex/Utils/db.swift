//
//  db.swift
//  PokePokedex
//
//  Created by Priscila Moro on 21/12/2022.
//

import Foundation

class Favorites: ObservableObject {
    static let instance = Favorites()
    @Published
    var arrayPokesFavoritesDB = [Pokemon]() //= []
}

//func getDB() -> [Pokemon] {
//    return arrayPokesFavoritesDB
//}
