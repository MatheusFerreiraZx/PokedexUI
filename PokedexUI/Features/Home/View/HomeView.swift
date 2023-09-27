//
//  HomeView.swift
//  PokedexUI
//
//  Created by Matheus Ferreira on 19/08/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: homeViewModel
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
             
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(viewModel.pokemonModel) { pokemon in
                        PokemonCell(pokemon: pokemon)
                    }
                }
            }
            .navigationTitle("Pokedex")
            .padding(10)
        }
        .onAppear {
            viewModel.fetchPokemons()
        }
    }
}

#Preview {
    HomeView(viewModel: homeViewModel())
}
