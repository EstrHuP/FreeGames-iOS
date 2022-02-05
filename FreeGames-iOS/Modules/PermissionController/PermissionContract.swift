//
//  PermissionContract.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 4/2/22.
//

import Foundation
import UIKit

protocol PermissionViewContract: UIViewController {
    var presenter: PermissionPresenterContract? {get set}
    
    func isNotificationOK()
    func isNotificationNotAllowed()
    func openSettings()
    func showMessageAllowed()
}

protocol PermissionPresenterContract: AnyObject {
    var view: PermissionViewContract? {get set}
    var interactor: PermissionInteractorContract? {get set}
    func pushNotificationLocal()
    func didUpdatePermission()
    func didPressPermissionButton()
}

protocol PermissionInteractorContract {
    var output: PermissionInteractorOutputContract? {get set}
    
    func askForNotificationPermission()
}

protocol PermissionInteractorOutputContract: AnyObject {
    func didUpdateNotificationPermission()
}
