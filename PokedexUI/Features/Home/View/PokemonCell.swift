//
//  PokemonCell.swift
//  PokedexUI
//
//  Created by Matheus Ferreira on 19/08/23.
//

import SwiftUI

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
                
                avatar()
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
    
    @ViewBuilder
    func avatar() -> some View {
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

#Preview {
    HomeView(viewModel: homeViewModel())
}
