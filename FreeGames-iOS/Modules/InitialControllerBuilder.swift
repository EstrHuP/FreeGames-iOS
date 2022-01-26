//
//  InitialControllerBuilder.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 24/1/22.
//

import Foundation
import UIKit

class InitialControllerBuilder {
    func build() -> UIViewController {
        let viewController = GamesControllerBuilder().build()
        return viewController
    }
}
