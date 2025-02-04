//
//  CharacterViewProtocol.swift
//  RMCoreDataVIPER
//
//  Created by Ибрагим Габибли on 04.02.2025.
//

import Foundation

protocol CharacterViewProtocol: AnyObject {
    func displayCharacters(_ characters: [Entity])
    func displayError(_ message: String)
}
