//
//  ImageLoader.swift
//  RMCoreDataVIPER
//
//  Created by Ибрагим Габибли on 06.03.2025.
//

import Foundation
import UIKit.UIImage

final class ImageLoader: ImageLoaderProtocol {
    private var counter = 1

    func loadImage(from urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Invalid URL for image")
            completion(nil, NetworkError.invalidURL)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error {
                print("Failed to load image: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }

            guard let data else {
                print("No data for image")
                DispatchQueue.main.async {
                    completion(nil, NetworkError.noData)
                }
                return
            }
            DispatchQueue.main.async {
                completion(data, nil)
                print("Load image \(self.counter)")
                self.counter += 1
            }
        }.resume()
    }
}
