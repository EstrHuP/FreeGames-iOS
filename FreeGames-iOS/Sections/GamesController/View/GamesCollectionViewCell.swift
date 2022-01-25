//
//  GamesCollectionViewCell.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 24/1/22.
//

import UIKit

struct GamesCollectionCellViewModel {
    let name: String
}

class GamesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameGame: UILabel!
    @IBOutlet weak var imageGame: UIImageView!
    
    func configure(viewModel: GamesCollectionCellViewModel) {
        nameGame.text = viewModel.name
        //TODO: install kingfisher for show image
        cardDesign()
    }
}

extension GamesCollectionViewCell {
    private func cardDesign() {
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        clipsToBounds = true
    }
}
