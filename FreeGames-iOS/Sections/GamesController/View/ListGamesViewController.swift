//
//  ListGamesViewController.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 25/1/22.
//

import UIKit

class ListGamesViewController: UIViewController, GamesViewContract {
    
    var presenter: GamesPresenterContract?
    
    @IBOutlet weak var gamesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gamesCollectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.gamesCollectionView.reloadData()
        }
    }
}

extension ListGamesViewController {
    static func createFromStoryBoard() -> ListGamesViewController {
        return UIStoryboard(name: "ListGamesViewController", bundle: .main).instantiateViewController(withIdentifier: "ListGamesViewController") as! ListGamesViewController
    }
    
    private var layout: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 30, right: 10)
        
        //Calcular espacio de las celdas (en este caso se mostrarán 2)
        let width = (gamesCollectionView.frame.width / 2) //ancho
        let total = width - (layout.minimumInteritemSpacing / 2) //interitemSpacing
        let totalIzq = total - layout.sectionInset.left //izquierdo
        
        //layout.estimatedItemSize = CGSize(width: totalIzq, height: totalIzq)
        layout.itemSize = CGSize(width: totalIzq, height: totalIzq)
        
        return layout
    }
}

extension ListGamesViewController: UICollectionViewDataSource {
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
