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

protocol UserService {
    func authorization(login: String) -> User?
}


class CurrentUserService: UserService {
   
    var user = User(login: "rio", fullName: "Попугай", avatar: UIImage(named: "рио")!, status: "в сети")
    
    func authorization(login: String) -> User? {
        if login == user.login {return user}
        return nil
    }
}

class TestUserService: UserService {
    
    var testUser = User(login: "test", fullName: "test", avatar: UIImage(named: "рио")!, status: "test")
    
    func authorization(login: String) -> User? {
        if login == testUser.login {return testUser}
        return nil
    }
}
    


