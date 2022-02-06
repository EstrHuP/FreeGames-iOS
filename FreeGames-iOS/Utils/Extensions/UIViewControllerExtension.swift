//
//  UIViewControllerExtension.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 27/1/22.
//

import Foundation
import UIKit

extension UIViewController {
    static func createFromStoryBoard() -> Self {
        return UIStoryboard(name: String(describing: self), bundle: .main).instantiateViewController(withIdentifier: String(describing: self)) as! Self
    }
    
    func presentAlert(withTitle title: String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
} 
