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
    @State private var image: UIImage?
    
    init(pokemon: PokemonModel, viewModel: PokemonViewModel) {
        self.pokemon = pokemon
        self.viewModel = viewModel
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
                    
                    
                    if let image = image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 68, height: 68)
                            .padding([.bottom, .trailing], 4)
                    } else {
                        Image(systemName: "questionmark.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 68, height: 68)
                            .padding([.bottom, .trailing], 4)
                            .onAppear {
                                loadImage()
                            }
                    }
                }
            }
        }
        .background(Color(viewModel.backgroundColor(forType: pokemon.type)))
        .cornerRadius(12)
        .shadow(color: Color(viewModel.backgroundColor(forType: pokemon.type)), radius: 6, x: 0.0, y: 0.0)
    }
    
    private func loadImage() {
        guard let imageUrl = URL(string: pokemon.imageUrl) else { return }
        
        URLSession.shared.dataTask(with: imageUrl) { data, _, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }.resume()
    }
}
