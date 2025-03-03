//
//  ImageLoaderProtocol.swift
//  RMCoreDataVIPER
//
//  Created by Ибрагим Габибли on 03.03.2025.
//

import Foundation

protocol ImageDataFetcherProtocol {
    func getImageData(for characterId: Int64) -> Data?
}
