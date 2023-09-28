//
//  PokemonCell.swift
//  PokedexUI
//
//  Created by Matheus Ferreira on 19/08/23.
//

import SwiftUI
import Kingfisher
struct PokemonCell: View {
    
    let pokemon: PokemonModel
    @State private var image: UIImage?
    
    var body: some View {
        let color = Color.pokemon(type: pokemon.pokemonType)
        ZStack {
            VStack {
                HStack {
                    title
                    Spacer()
                    type
                }
                .padding(.top, 10)
                .padding(.horizontal, 10)
                
                if let url = URL(string: pokemon.imageUrl) {
                    KFImage(url)
                        .placeholder {
                            ProgressView()
                        }
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130, height: 150)
                        .padding(10)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(color)
        .cornerRadius(12)
        .shadow(color: color.opacity(0.7), radius: 6, x: 0.0, y: 0.0)
    }
    
    var title: some View {
        Text(pokemon.name.capitalized)
            .font(.headline).bold()
            .foregroundColor(.white)
    }
        
    var type: some View {
        Text(pokemon.pokemonType.rawValue)
            .font(.subheadline).bold()
            .foregroundColor(.white)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white.opacity(0.25))
            )
    }
}

#Preview {
    HomeView(viewModel: homeViewModel())
}
