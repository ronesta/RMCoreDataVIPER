//
//  CharacterInteractorProtocol.swift
//  RMCoreDataVIPER
//
//  Created by Ибрагим Габибли on 04.02.2025.
//

import Foundation

protocol CharacterInteractorProtocol: AnyObject {
    func getCharacters()

    func getImageData(for characterId: Int64) -> Data?
}
