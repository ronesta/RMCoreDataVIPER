//
//  NetworkManager.swift
//  RMCoreDataVIPER
//
//  Created by Ибрагим Габибли on 02.02.2025.
//

import Foundation

final class CharacterService: CharacterServiceProtocol {
    private var counter = 1

    private let urlString = "https://rickandmortyapi.com/api/character"

    func getCharacters(completion: @escaping ([Character]?, Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil, NetworkError.invalidURL)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error {
                print("Error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }

            guard let data else {
                print("No data")
                DispatchQueue.main.async {
                    completion(nil, NetworkError.noData)
                }
                return
            }

            do {
                let characters = try JSONDecoder().decode(PostCharacters.self, from: data)
                DispatchQueue.main.async {
                    completion(characters.results, nil)
                    print("Load data \(self.counter)")
                    self.counter += 1
                }
            } catch {
                print("Decoding error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }.resume()
    }
}
