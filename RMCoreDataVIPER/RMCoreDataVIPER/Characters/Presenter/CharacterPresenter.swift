//
//  CharacterPresenter.swift
//  RMCoreDataVIPER
//
//  Created by Ибрагим Габибли on 04.02.2025.
//

import Foundation

final class CharacterPresenter: CharacterPresenterProtocol {
    weak var view: CharacterViewProtocol?

    private let interactor: CharacterInteractorProtocol
    private let router: CharacterRouterProtocol

    init(interactor: CharacterInteractorProtocol,
         router: CharacterRouterProtocol
    ) {
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        interactor.getCharacters()
    }

    func charactersFetched(_ characters: [Entity]) {
        view?.displayCharacters(characters)
    }
}
