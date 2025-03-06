//
//  ImageLoader.swift
//  RMCoreDataVIPER
//
//  Created by Ибрагим Габибли on 03.03.2025.
//

import Foundation

final class ImageDataFetcher: ImageDataFetcherProtocol {
    private let storageManager: StorageManagerProtocol

    init(storageManager: StorageManagerProtocol) {
        self.storageManager = storageManager
    }

    func getImageData(for characterId: Int64) -> Data? {
        storageManager.fetchImageData(forCharacterId: characterId)
    }
}
