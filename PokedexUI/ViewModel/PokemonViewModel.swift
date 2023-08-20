//
//  PokemonViewModel.swift
//  PokedexUI
//
//  Created by Matheus Ferreira on 19/08/23.
//

import SwiftUI

class PokemonViewModel: ObservableObject {
    
    @Published var pokemonModel = [PokemonModel]()
    
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        fetchPokemons()
    }
    
    func fetchPokemons(){
        
        guard let url = URL(string: baseUrl) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data?.parseData(removeString: "null,") else { return }
            guard let pokemon = try? JSONDecoder().decode([PokemonModel].self, from: data) else { return }
            
            DispatchQueue.main.async {
                self.pokemonModel = pokemon
            }
            
        }.resume()
    }
       
       func backgroundColor( forType type: String ) -> UIColor {
           switch type {
           case "fire": return .systemRed
           case "poison": return .systemGreen
           case "water": return .systemBlue
           case "electric": return .systemYellow
           case "psychic": return .systemPurple
           case "normal": return .systemOrange
           case "ground": return .systemGray
           case "flying": return .systemTeal
           case "fairy": return .systemPink
           default: return  .systemIndigo
           }
       }
       
   }

   extension Data {
       
       func parseData(removeString string: String ) -> Data? {
           let dataAsString = String(data: self, encoding: .utf8)
           let parseDataString  = dataAsString?.replacingOccurrences(of: string, with: "")
           guard let data = parseDataString?.data(using: .utf8) else { return nil}
           return data
       }
       
   }
