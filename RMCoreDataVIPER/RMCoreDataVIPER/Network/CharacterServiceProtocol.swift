//
//  NetworkManagerProtocol.swift
//  RMCoreDataVIPER
//
//  Created by Ибрагим Габибли on 04.02.2025.
//

import Foundation

protocol CharacterServiceProtocol {
    func getCharacters(completion: @escaping ([Character]?, Error?) -> Void)
}
