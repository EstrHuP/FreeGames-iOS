//
//  GameDetailViewController.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 27/1/22.
//

import UIKit

struct GameDetailViewModel {
    let name: String
    let image: URL?
}

class GameDetailViewController: UIViewController {

    @IBOutlet weak var gameDetailImage: UIImageView!
    @IBOutlet weak var gameDetailTitle: UILabel!
    
    var viewModel: GameDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameDetailTitle.text = "hoasofalsdkfjaslkdfjañslkdjfalñksdajfklñasjdñflaksjdfañlskdfjalksjdfñalks"
    }
}
