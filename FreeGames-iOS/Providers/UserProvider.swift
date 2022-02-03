//
//  UserProvider.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 1/2/22.
//

import Foundation

protocol UserProviderContract {
    func getUser(for fileUrl: URL?, _ completion: @escaping(Result<User, Error>) ->())
    func saveDataUser(for user: User, with fileURL: URL?, _ completion: @escaping(Result<User, Error>) -> ())
}

class NetworkUserProvider: UserProviderContract {
    
    var user: User?
    
    func getUser(for fileUrl: URL?, _ completion: @escaping (Result<User, Error>) -> ()) {
        loadUser(for: fileUrl) { user in
            guard let user = user else { return }
            self.user = user
            print("estoy devolviendo datos del usuario: \(String(describing: self.user))")
            completion(.success(user))
        }
    }
    
    func loadUser(for fileUrl: URL?, _ completion: @escaping (User?) -> ()) {
        DispatchQueue.global().async {
            guard let url = fileUrl else {
                completion(nil)
                return
            }
            guard let data = try? Data(contentsOf: url) else {
                completion(nil)
                return
            }
            do {
                let user = try PropertyListDecoder().decode(User.self, from: data)
                completion(user)
            } catch { }
        }
    }
    
    func saveDataUser(for user: User, with fileURL: URL?, _ completion: @escaping (Result<User, Error>) -> ()) {
        guard let url = fileURL else { return }
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        do {
            let data = try encoder.encode(user)
            try data.write(to: url)
            completion(.success(user))
        } catch { completion(.failure(error)) }
    }
}
