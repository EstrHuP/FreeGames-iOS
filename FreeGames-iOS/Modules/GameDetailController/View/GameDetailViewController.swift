//
//  GameDetailViewController.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 27/1/22.
//

import UIKit
import Kingfisher

struct GameDetailViewModel {
    let name: String
    let image: URL?
    let descrip: String
}

class GameDetailViewController: UIViewController {

    @IBOutlet weak var gameDetailImage: UIImageView!
    @IBOutlet weak var gameDetailTitle: UILabel!
    @IBOutlet weak var gameDetailDescription: UILabel!
    
    var viewModel: GameDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
}

extension GameDetailViewController {
    func configure() {
        gameDetailTitle.text = viewModel?.name
        gameDetailImage.kf.indicatorType = .activity
        gameDetailImage.kf.setImage(with: viewModel?.image)
        gameDetailDescription.text = viewModel?.descrip
    }
}
