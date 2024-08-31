//
//  HomeView.swift
//  PokedexUI
//
//  Created by Matheus Ferreira on 19/08/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = homeViewModel()
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    
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
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading:
                                    HStack {
                Image(.pokeball)
                    .resizable()
                    .frame(width: 40, height: 40)
                Text("Pokedex")
                    .font(Font.system(size: 26))
            }, trailing: HStack {
                Button(action: {
                    isDarkMode.toggle()
                }) {
                    Image(systemName: isDarkMode ? "moon.circle.fill" : "sun.max.fill")
                        .font(.title)
                }
                Spacer()
                    .searchable(text: $viewModel.searchText)
            })
        }
        .onAppear {
            viewModel.fetchPokemons()
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
    
    private var filteredPokemon: [PokemonModel] {
        if viewModel.searchText.isEmpty {
            return viewModel.pokemonModel
        } else {
            let searchTextLowercased = viewModel.searchText.lowercased()
            return viewModel.pokemonModel.filter { pokemon in
                let formattedId = String(format: "%03d", pokemon.id)
                return pokemon.name.lowercased().contains(searchTextLowercased) ||
                formattedId.contains(searchTextLowercased)
            }
        }
    }
}

#Preview {
    HomeView(viewModel: homeViewModel())
}
