//
//  CharacterPresenter.swift
//  RMCoreDataVIPER
//
//  Created by Ибрагим Габибли on 04.02.2025.
//

import Foundation

final class CharacterPresenter: CharacterPresenterProtocol {
    weak var view: CharacterViewProtocol?
    var interactor: CharacterInteractorProtocol?
    var router: CharacterRouterProtocol?

    func viewDidLoad() {
        interactor?.getCharacters()
    }

    func charactersFetched(_ characters: [Entity]) {
        view?.displayCharacters(characters)
    }

    func charactersFetchFailed(with error: Error) {
        view?.displayError("Failed to load characters: \(error.localizedDescription)")
    }

    func fetchImageData(for characterId: Int64) -> Data? {
        interactor?.getImageData(for: characterId)
    }
}
