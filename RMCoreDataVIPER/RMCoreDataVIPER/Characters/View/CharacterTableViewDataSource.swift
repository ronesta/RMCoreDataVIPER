//
//  CharacterTableViewDataSource.swift
//  RMCoreDataVIPER
//
//  Created by Ибрагим Габибли on 04.02.2025.
//

import Foundation
import UIKit

final class CharacterTableViewDataSource: NSObject, CharacterDataSourceProtocol {
    private let imageDataFetcher: ImageDataFetcherProtocol
    var characters = [Entity]()

    init(imageDataFetcher: ImageDataFetcherProtocol) {
        self.imageDataFetcher = imageDataFetcher
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CharacterTableViewCell.id,
            for: indexPath) as? CharacterTableViewCell else {
            return UITableViewCell()
        }

        let character = characters[indexPath.row]

        guard let imageData = imageDataFetcher.getImageData(for: character.id),
              let image = UIImage(data: imageData) else {
            return cell
        }

        cell.configure(with: character, image: image)

        return cell
    }
}
