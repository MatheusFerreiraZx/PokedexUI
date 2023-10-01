//
//  HomeView.swift
//  PokedexUI
//
//  Created by Matheus Ferreira on 19/08/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = homeViewModel()
    
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(filteredPokemon) { pokemon in
                        PokemonCell(pokemon: pokemon)
                    }
                }
            }
            .padding(.horizontal, 8)
            .ignoresSafeArea(.all, edges: .bottom)
            .navigationTitle("Pokedex")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: HStack {
                Spacer()
                .searchable(text: $viewModel.searchText)
            })
        }
        .onAppear {
            viewModel.fetchPokemons()
        }
    }

    private var filteredPokemon: [PokemonModel] {
        return viewModel.searchText.isEmpty
            ? viewModel.pokemonModel
            : viewModel.pokemonModel.filter { $0.name.lowercased().contains(viewModel.searchText.lowercased()) }
        }
    }

#Preview {
    HomeView(viewModel: homeViewModel())
}
