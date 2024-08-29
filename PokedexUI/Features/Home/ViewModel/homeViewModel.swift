//
//  PokemonViewModel.swift
//  PokedexUI
//
//  Created by Matheus Ferreira on 19/08/23.
//

import Foundation

class homeViewModel: ObservableObject {
    
    @Published var pokemonModel = [PokemonModel]()
    @Published var searchText: String = ""
    
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    func fetchPokemons() {
        guard let url = URL(string: baseUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Erro na requisição: \(error)")
                return
            }
            guard let data = data?.parseData(removeString: "null,") else { return }
            
            do {
                let pokemon = try JSONDecoder().decode([PokemonModel].self, from: data)
                DispatchQueue.main.async {
                    self.pokemonModel = pokemon
                }
            } catch {
                print("Erro na decodificação: \(error)")
            }
        }.resume()
    }
}
