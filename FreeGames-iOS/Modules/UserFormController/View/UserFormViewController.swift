//
//  UserFormViewController.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 1/2/22.
//

import UIKit

struct UserFormViewModel {
    let name: String?
    let lastName: String?
    let phone: String?
    let mail: String?
    let bio: String?
}

class UserFormViewController: UIViewController, UserFormViewContract {
    
    var presenter: UserFormPresenterContract?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func configure(with viewModel: UserFormViewModel) {
        
    }
}
