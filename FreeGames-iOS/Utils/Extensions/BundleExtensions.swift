//
//  BundleExtensions.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 29/1/22.
//

import Foundation

extension Bundle {
    var baseAPIUrl: URL {
        guard let urlString = infoDictionary?["API_BASE_URL"] as? String else {
            fatalError("Invalid base URL")
        }
        return URL(string: urlString)!
    }
}
