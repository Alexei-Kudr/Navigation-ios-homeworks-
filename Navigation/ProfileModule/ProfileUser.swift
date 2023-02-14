//
//  ProfileUser.swift
//  Navigation
//
//

import UIKit

class User {
    var login: String
    var fullName: String
    var avatar: UIImage?
    var status: String
    
    init(login: String, fullName: String, avatar: UIImage, status: String) {
        self.login = login
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}

var user = User(login: "Вася", fullName: "Кот", avatar: UIImage(named: "kot")!, status: "в сети")


protocol UserService {
    func authorization(login: String) -> User?
}


class CurrentUserService: UserService {
    func authorization(login: String) -> User? {
       if login == user.login {return user}
        return nil
    }

}

