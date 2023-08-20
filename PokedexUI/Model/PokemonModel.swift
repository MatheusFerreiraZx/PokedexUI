//
//  Pokemon.swift
//  PokedexUI
//
//  Created by Matheus Ferreira on 19/08/23.
//

import Foundation

struct PokemonModel: Decodable, Identifiable {
    
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
}
