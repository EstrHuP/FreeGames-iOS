//
//  UserFormContract.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 1/2/22.
//

import Foundation
import UIKit

protocol UserFormViewContract: UIViewController {
    var presenter: UserFormPresenterContract? {get set}
    
    func configure(with viewModel: UserFormViewModel)
}

protocol UserFormPresenterContract {
    var view: UserFormViewContract? {get set}
}
