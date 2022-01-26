//
//  GamesCollectionViewCell.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 24/1/22.
//

import UIKit
import Kingfisher

struct GamesCollectionCellViewModel {
    let name: String
    let image: URL?
    let genre: String
}

class GamesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var genreView: UIView!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var platformImage: UIImageView!
    
    func configure(viewModel: GamesCollectionCellViewModel) {
        gameTitle.text = viewModel.name
        gameImage.kf.indicatorType = .activity
        gameImage.kf.setImage(with: viewModel.image)
        genreLabel.text = viewModel.genre
        cardDesign()
    }
}

extension GamesCollectionViewCell {
    private func cardDesign() {
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        
        layer.shadowColor = UIColor(named: "customCollectionCellColor")?.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
    }
}
