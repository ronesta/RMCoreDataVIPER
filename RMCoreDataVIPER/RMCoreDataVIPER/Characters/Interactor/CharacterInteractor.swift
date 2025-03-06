//
//  CharacterInteractor.swift
//  RMCoreDataVIPER
//
//  Created by Ибрагим Габибли on 04.02.2025.
//

import Foundation

final class CharacterInteractor: CharacterInteractorProtocol {
    weak var presenter: CharacterPresenterProtocol?

    private let characterService: CharacterServiceProtocol
    private let imageLoader: ImageLoaderProtocol
    private let storageManager: StorageManagerProtocol

    init(characterService: CharacterServiceProtocol,
         imageLoader: ImageLoaderProtocol,
         storageManager: StorageManagerProtocol
    ) {
        self.characterService = characterService
        self.imageLoader = imageLoader
        self.storageManager = storageManager
    }

    func getCharacters() {
        let savedCharacters = storageManager.fetchCharacters()

        guard savedCharacters.isEmpty else {
            presenter?.charactersFetched(savedCharacters)
            return
        }

        characterService.getCharacters { [weak self] result, error in
            guard let self else {
                return
            }

            if let error {
                print("Error getting characters: \(error)")
                return
            }

            guard let result else {
                print("No result returned.")
                return
            }

            var charactersToSave: [(character: Character, imageData: Data)] = []

            let group = DispatchGroup()

            result.forEach { res in
                group.enter()
                self.imageLoader.loadImage(from: res.image) { data, error in
                    defer {
                        group.leave()
                    }

                    if let error {
                        print("Failed to load image: \(error)")
                        return
                    }

                    guard let data else {
                        print("No data for image")
                        return
                    }

                    charactersToSave.append((character: res, imageData: data))
                }
            }

            group.notify(queue: .main) { [weak self] in
                guard let self else {
                    return
                }
                self.storageManager.saveCharacters(charactersToSave)

                DispatchQueue.main.async {
                    let fetchCharacters = self.storageManager.fetchCharacters()
                    self.presenter?.charactersFetched(fetchCharacters)
                }
            }
        }
    }
}
