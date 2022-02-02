//
//  UserFormPresenter.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 1/2/22.
//

import Foundation

class UserFormPresenter: UserFormPresenterContract {
    weak var view: UserFormViewContract?
    var interactor: UserFormInteractorContract?
    
    var userData: User = User(name: nil, lastName: nil, phone: nil, mail: nil, bio: nil) {
        didSet {
            print(userData)
        }
    }
    
    func viewDidLoad() {
        interactor?.output = self
        interactor?.fetchDataUser()
    }
    
    func saveDataUser(){
        guard userData.isValidField else {
            view?.showValidationError()
            return
        }
        interactor?.output = self
        interactor?.fetchSaveDataUser(user: userData)
    }
    
    func didUpdateName(_ name: String?) {
        userData.name = name
        view?.didValidateName(userData.isNotEmptyName)
    }
    
    func didUpdateLastName(_ lasName: String?) {
        userData.lastName = lasName
        view?.didValidateLastName(userData.isNotEmptyLastName)
    }
    
    func didUpdatePhone(_ phone: String?) {
        userData.phone = phone
        view?.didValidatePhone(userData.isNotEmptyPhone)
    }
    
    func didUpdateMail(_ mail: String?) {
        userData.mail = mail
        view?.didValidateMail(userData.isNotEmptyMail)
    }
    
    func didUpdateBio(_ bio: String?) {
        userData.bio = bio
    }
}

extension UserFormPresenter: UserFormInteractorOuputContract {
    func didFetchDataUser(user: User) {
        self.userData = user
        self.view?.configure(with: userData.userDataModel)
    }
    
    func didFailedDataUser() {
        print("Error in User data")
    }
    
    func didFetchSaveDataUser(user: User) {
        self.userData = user
    }
    
    func didFailedSaveDataUser() {
        print("Error in Save User dat")
    }
}
