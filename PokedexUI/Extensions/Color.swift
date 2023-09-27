//
//  Color.swift
//  PokedexUI
//
//  Created by jonata klabunde on 27/09/23.
//

import SwiftUI

extension Color {
    
    /// you can call access globaly
    static func pokemon(type: PokemonModel.PokemonType) -> Color {
        switch type {
            case .fire: return Color(.systemRed)
            case .poison: return Color(.systemGreen)
            case .water: return Color(.systemBlue)
            case .electric: return Color(.systemYellow)
            case .psychic: return Color(.systemPurple)
            case .normal: return Color(.systemOrange)
            case .ground: return Color(.systemGray)
            case .flying: return Color(.systemTeal)
            case .fairy: return Color(.systemPink)
            default: return  Color(.systemIndigo)
        }
    }
}

