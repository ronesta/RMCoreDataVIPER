//
//  ImageLoaderProtocol.swift
//  RMCoreDataVIPER
//
//  Created by Ибрагим Габибли on 06.03.2025.
//

import Foundation
import UIKit.UIImage

protocol ImageLoaderProtocol {
    func loadImage(from urlString: String, completion: @escaping (Data?, Error?) -> Void)
}
