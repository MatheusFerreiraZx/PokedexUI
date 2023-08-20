//
//  PokemonCell.swift
//  PokedexUI
//
//  Created by Matheus Ferreira on 19/08/23.
//

import SwiftUI

struct PokemonCell: View {
    
    let pokemon: PokemonModel
    let viewModel: PokemonViewModel
    let backgroundColor: Color
    
    init(pokemon: PokemonModel, viewModel: PokemonViewModel) {
        self.pokemon = pokemon
        self.viewModel = viewModel
        self.backgroundColor = Color(viewModel.backgroundColor(forType: pokemon.type))
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 4)
                    .padding(.leading)
                
                HStack {
                    Text(pokemon.type)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .frame(width: 100, height: 24)

                    
                    Image("pokemon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 68, height: 68)
                        .padding([.bottom, .trailing], 4)
                }
            }
        }
        .background(backgroundColor)
        .cornerRadius(12)
        .shadow(color: backgroundColor, radius: 6, x: 0.0, y: 0.0)
    }
}
