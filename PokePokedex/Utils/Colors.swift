//
//  Colors.swift
//  PokePokedex
//
//  Created by Priscila Moro on 19/12/2022.
//

import Foundation
import SwiftUI

class Colors {
    let dragon = Color(red: 236 / 255, green: 168  / 255, blue: 139  / 255)
    let poison = Color(red: 145 / 255, green: 209 / 255, blue: 182 / 255)
    let water = Color(red: 159 / 255, green: 247 / 255, blue: 253 / 255)
    let ice = Color(red: 255 / 255, green: 255 / 255, blue: 253 / 255)
    let electric = Color(red: 112 / 255, green: 208 / 255, blue: 246 / 255)
    let fairy = Color(red: 250 / 255, green: 237 / 255, blue: 241 / 255)
    let flying = Color(red: 229 / 255, green: 197 / 255, blue: 192 / 255)
    let ground = Color(red: 204 / 255, green: 171 / 255, blue: 144 / 255)
    let normal = Color(red: 253 / 255, green: 253 / 255, blue: 150 / 255)
    let psychic = Color(red: 193 / 255, green: 255 / 255, blue: 225 / 255)
    let grass = Color(red: 171 / 255, green: 202 / 255, blue: 177 / 255)
    let bug = Color(red: 205 / 255, green: 134 / 255, blue: 121 / 255)
    let fighting = Color(red: 194 / 255, green: 177 / 255, blue: 213 / 255)
    let steel = Color(red: 156 / 255, green: 182 / 255, blue: 198 / 255)
    let rock = Color(red: 192 / 255, green: 192 / 255, blue: 192 / 255)
    let fire = Color(red: 255 / 255, green: 164 / 255, blue: 101 / 255)
}

func chooseColor(type: String?) -> Color {
    switch type {
    case "dragon":
        return Color(.systemRed)
    case "fire":
        return Color(.systemOrange)
    case "poison":
        return Color(.systemGreen)
    case "water":
        return Color(.systemTeal)
    case "electric":
        return Color(.systemYellow)
    case "psychic":
        return Color(.systemBlue).opacity(0.5)
    case "normal":
        return Color(.systemBlue)
    case "ground":
        return Color(.systemBrown).opacity(0.5)
    case "flying":
        return Color(.systemOrange).opacity(0.5)
    case "fairy":
        return Color(.systemPurple)
    case "grass":
        return Color(.systemMint)
    case "fighting":
        return Color(.magenta)
    case "steel":
        return Color(.systemGray3)
    case "ice":
        return Color(.systemTeal).opacity(0.5)
    case "rock":
        return Color(.systemGray)
    case "bug":
        return Color(.systemBrown)
    default:
        return Color(.black)
    }
}

extension Pokemon {
    var typeColor: Color {
        switch type {
        case "dragon":
            return Color(.systemRed)
        case "fire":
            return Color(.systemOrange)
        case "poison":
            return Color(.systemGreen)
        case "water":
            return Color(.systemTeal)
        case "electric":
            return Color(.systemYellow)
        case "psychic":
            return Color(.systemBlue).opacity(0.5)
        case "normal":
            return Color(.systemBlue)
        case "ground":
            return Color(.systemBrown).opacity(0.5)
        case "flying":
            return Color(.systemOrange).opacity(0.5)
        case "fairy":
            return Color(.systemPurple)
        case "grass":
            return Color(.systemMint)
        case "fighting":
            return Color(.magenta)
        case "steel":
            return Color(.systemGray3)
        case "ice":
            return Color(.systemTeal).opacity(0.5)
        case "rock":
            return Color(.systemGray)
        case "bug":
            return Color(.systemBrown)
        default:
            return Color(.black)
        }
    }
    
    var backgroundColor: UIColor {
        switch type {
        case "bug", "ground": return .systemBrown
        case "dragon": return .systemRed
        case "poison": return .systemGreen
        case "water", "ice": return .systemTeal
        case "electric": return .systemYellow
        case "fairy": return .systemPurple
        case "fire", "flying": return .systemOrange
        case "rock": return .systemGray
        case "steel": return .systemGray3
        case "grass": return .systemMint
        case "fighting": return .magenta
        case "psychic", "normal": return .systemBlue
        default: return .systemPink
        }
    }
}
