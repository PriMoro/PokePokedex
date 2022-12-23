//
//  PokemonModel.swift
//  PokePokedex
//
//  Created by Priscila Moro on 19/12/2022.
//

import Foundation
import SwiftUI


struct Pokemon: Identifiable, Decodable, Hashable {
    let pokeID = UUID()
    
    var isFavorite: Bool = false
    
    let id: Int
    let name: String
    let imageUrl: String
    let description: String
    let height: Int
    let weight: Int
    let attack: Int
    let defense: Int
    let type: String
    //var evolutionChain: [EvolutionChain]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageUrl
        case description
        case height
        case weight
        case attack
        case defense
        case type
        //case evolutionChain
    }
    
}
struct EvolutionChain: Decodable {
    let id: String?
    let name: String?
}

extension Data {
    func removeNullFrom(string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
