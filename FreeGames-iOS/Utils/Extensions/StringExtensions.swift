//
//  StringExtensions.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 2/2/22.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
