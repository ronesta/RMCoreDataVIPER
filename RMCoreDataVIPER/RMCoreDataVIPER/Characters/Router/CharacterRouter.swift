//
//  CharacterRouter.swift
//  RMCoreDataVIPER
//
//  Created by Ибрагим Габибли on 04.02.2025.
//

import Foundation
import UIKit.UIViewController

final class CharacterRouter: CharacterRouterProtocol {
    weak var viewController: UIViewController?

    func createModule() -> UIViewController {
        let storageManager = CoreDataManager()
        let networkManager = NetworkManager()
        let imageDataFetcher = ImageDataFetcher(storageManager: storageManager)

        let dataSource = CharacterTableViewDataSource(imageDataFetcher: imageDataFetcher)
        let router = CharacterRouter()

        let interactor = CharacterInteractor(networkManager: networkManager,
                                             storageManager: storageManager
        )
        let presenter = CharacterPresenter(interactor: interactor,
                                           router: router
        )
        let view = CharacterViewController(presenter: presenter,
                                           dataSource: dataSource
        )

        presenter.view = view
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
