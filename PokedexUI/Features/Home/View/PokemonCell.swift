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
            VStack(alignment: .leading) {
                HStack {
                    title
                    Spacer()
                    id
                }
                .padding(.top, 10)
                .padding(.horizontal, 10)
                
                Spacer()
                
                HStack {
                    type
                    Spacer()
                    if let url = URL(string: pokemon.imageUrl) {
                        KFImage(url)
                            .placeholder {
                                ProgressView()
                            }
                            .resizable()
                            .scaledToFit()
                            .frame(width: 90, height: 80)
                            .padding(10)
                    }
                }
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(color)
        .cornerRadius(12)
        .shadow(color: color.opacity(0.7), radius: 6, x: 0.0, y: 0.0)
    }
    
    var id: some View {
        Text(String(formattedId))
            .font(.headline).bold()
            .foregroundColor(.white)
    }
    
    var formattedId: String {
        let id = pokemon.id
        if id / 10 < 1 {
            return "#00\(id)"
        } else if id / 10 < 10 {
            return "#0\(id)"
        } else {
            return "#\(id)"
        }
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
            .padding(.horizontal, 5)
            .padding(.vertical, 5)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white.opacity(0.25))
            )
    }
}

#Preview {
    HomeView(viewModel: homeViewModel())
}
