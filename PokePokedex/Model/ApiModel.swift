//
//  ApiModel.swift
//  PokePokedex
//
//  Created by Priscila Moro on 19/12/2022.
//

import Foundation

struct ModelApi: Decodable {
    
    let results: [Results]
}

struct Results: Decodable {

    let name: String
    let url: String

}

struct Demo: Decodable, Hashable {
    let name: String
    let typeofpokemon: [String]
}

