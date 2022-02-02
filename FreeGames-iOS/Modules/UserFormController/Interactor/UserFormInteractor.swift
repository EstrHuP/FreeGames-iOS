//
//  UserFormInteractor.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 1/2/22.
//

import Foundation

class UserFormInteractor: UserFormInteractorContract {
    
    weak var output: UserFormInteractorOuputContract?
    var userProvider: UserProviderContract?
    
    private let fileManager: FileManager
    private let fileName: String
    
    init(fileManager: FileManager = .default, fileName: String = "userData") {
        self.fileManager = fileManager
        self.fileName = fileName
    }
    
    private var fileUrl: URL? {
        let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("\(fileName).plist")
        return url
    }
    
    func fetchDataUser() {
        userProvider?.getUser(for: fileUrl, { result in
            switch result {
            case .success(let user):
                self.output?.didFetchDataUser(user: user)
            case .failure: self.output?.didFailedDataUser()
            }
        })
    }
    
    func fetchSaveDataUser(user: User) {
        userProvider?.saveDataUser(for: user, with: fileUrl, { result in
            switch result {
            case .success(let saveDataUser):
                self.output?.didFetchSaveDataUser(user: user)
            case .failure: self.output?.didFailedSaveDataUser()
            }
        })
    }
}
