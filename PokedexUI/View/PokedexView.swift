//
//  PokedexView.swift
//  PokedexUI
//
//  Created by Matheus Ferreira on 19/08/23.
//

import SwiftUI

struct PokedexView: View {
    private let gridItems = [GridItem(.flexible()),
        GridItem(.flexible())]
    @ObservedObject var viewModel = PokemonViewModel()
             
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(viewModel.pokemonModel)
                    {
                        pokemon in PokemonCell(pokemon: pokemon, viewModel: viewModel)
                    }
                }
            }
            .navigationTitle("Pokedex")
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
