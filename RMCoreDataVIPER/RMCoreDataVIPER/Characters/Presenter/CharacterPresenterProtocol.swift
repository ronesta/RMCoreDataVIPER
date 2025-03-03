//
//  CharacterPresenterProtocol.swift
//  RMCoreDataVIPER
//
//  Created by Ибрагим Габибли on 04.02.2025.
//

import Foundation

protocol CharacterPresenterProtocol: AnyObject {
    func viewDidLoad()

    func charactersFetched(_ characters: [Entity])
}
