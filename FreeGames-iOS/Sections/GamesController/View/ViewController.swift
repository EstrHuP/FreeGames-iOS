//
//  ViewController.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 24/1/22.
//

import UIKit

class ViewController: UIViewController, GamesViewContract {
    
    var presenter: GamesPresenterContract?
    
    @IBOutlet weak var gamesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.gamesCollectionView.reloadData()
        }
    }
}

extension ViewController {
    static func createFromStoryBoard() -> ViewController {
        return UIStoryboard(name: "ViewController", bundle: .main).instantiateViewController(withIdentifier: "ViewController") as! ViewController
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.numGamesRow ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let listGamesViewModel = presenter?.cellGamesViewModel(at: indexPath), let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GamesCollectionViewCell", for: indexPath) as? GamesCollectionViewCell else {
            fatalError()
        }
        
        cell.configure(viewModel: listGamesViewModel)
        
        return cell
    }
}


