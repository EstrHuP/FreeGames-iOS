//
//  User.swift
//  FreeGames-iOS
//
//  Created by Esther Huecas on 1/2/22.
//

import Foundation

struct User: Codable {
    var name: String?
    var lastName: String?
    var phone: String?
    var mail: String?
    var bio: String?
}

extension User {
    var isNotEmptyName: Bool {
        return isNotEmpty(field: name)
    }
    
    var isNotEmptyLastName: Bool {
        return isNotEmpty(field: lastName)
    }
    
    var isNotEmptyPhone: Bool {
        return isNotEmpty(field: phone)
    }
    
    var isNotEmptyMail: Bool {
        return isNotEmpty(field: mail)
    }
    
    var isNotEmptyBio: Bool {
        return isNotEmpty(field: bio)
    }
    
    var isValidField: Bool {
        return isNotEmptyName && isNotEmptyLastName && isNotEmptyPhone && isNotEmptyMail && isNotEmptyBio
    }
    
    var userDataModel: UserFormViewModel {
        UserFormViewModel(name: name, lastName: lastName, phone: phone, mail: mail, bio: bio)
    }
}

private extension User {
    func isNotEmpty(field: String?) -> Bool {
        guard let field = field else { return false }
        return !field.isEmpty
    }
}
