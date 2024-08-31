//
//  Pokemon.swift
//  PokedexUI
//
//  Created by Matheus Ferreira on 19/08/23.
//

import Foundation

struct PokemonModel: Codable, Identifiable {
    
    enum PokemonType: String, Codable {
        case fire, poison, water, electric, psychic, normal, ground, flying, fairy, none
    }
    
    let id: Int
    let name: String
    let imageUrl: String
    private let type: String
    
    var pokemonType: PokemonType {
        return PokemonType(rawValue: type) ?? .none
    }
}
