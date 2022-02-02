//
//  UserFormContract.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 1/2/22.
//

import Foundation
import UIKit

protocol UserFormViewContract: UIViewController {
    var presenter: UserFormPresenterContract? {get set}
    
    func configure(with viewModel: UserFormViewModel)
    
    func didValidateName(_ valid: Bool)
    func didValidateLastName(_ valid: Bool)
    func didValidatePhone(_ valid: Bool)
    func didValidateMail(_ valid: Bool)
    
    func showValidationError()
}

protocol UserFormPresenterContract: AnyObject {
    var view: UserFormViewContract? {get set}
    var interactor: UserFormInteractorContract? {get set}
    
    func viewDidLoad()
    func saveDataUser()
    
    func didUpdateName(_ name: String?)
    func didUpdateLastName(_ lasName: String?)
    func didUpdatePhone(_ phone: String?)
    func didUpdateMail(_ mail: String?)
    func didUpdateBio(_ bio: String?)
}

protocol UserFormInteractorContract {
    var output: UserFormInteractorOuputContract? {get set}
    var userProvider: UserProviderContract? {get set}
    func fetchDataUser()
    func fetchSaveDataUser(user: User)
}

protocol UserFormInteractorOuputContract: AnyObject {
    func didFetchDataUser(user: User)
    func didFailedDataUser()
    
    func didFetchSaveDataUser(user: User)
    func didFailedSaveDataUser()
}
