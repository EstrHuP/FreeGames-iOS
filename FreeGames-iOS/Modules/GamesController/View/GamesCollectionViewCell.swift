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
    let description: String
    let genre: String
    let type: String
}

class GamesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gameTitleLabel: UILabel!
    @IBOutlet weak var gameImage: UIImageView!
    
    func configure(viewModel: GamesCollectionCellViewModel) {
        gameImage.kf.indicatorType = .activity
        gameImage.kf.setImage(with: viewModel.image)
        gameTitleLabel.text = viewModel.name
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
