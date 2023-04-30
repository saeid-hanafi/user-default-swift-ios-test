//
//  User_Model.swift
//  user default test
//
//  Created by Macvps on 4/30/23.
//

import Foundation

protocol UserModelDelegate: AnyObject {
    func setUser(data: User)
    func getUser(data: User)
    func login(data: User?)
    func fail(error: String)
    func clear()
}

class User_Model {
    weak var delegate: UserModelDelegate!
    var userDF = UserDefaults.standard
    
    func setUser(data: User) {
        let username = data.userName
        let pass = data.password
        if (username != "" && pass != "") {
            userDF.set(["username": username, "password": pass], forKey: AppDelegate.key)
            
            delegate?.setUser(data: data)
        }else{
            delegate?.fail(error: "Require Fiels is Empty!!")
        }
    }
    
    func getUser() {
        let userInfo = userDF.value(forKey: AppDelegate.key)
        if userInfo != nil {
            let userData = userInfo as! [String: String]
            delegate?.getUser(data: User(userName: userData["username"]!, password: userData["password"]!))
        }else{
            delegate?.fail(error: "You are not login!!")
        }
    }
    
    func login(data: User) {
        let userInfo = userDF.value(forKey: AppDelegate.key)
        
        if userInfo != nil {
            let userData = userInfo as! [String: String]
            let savedUser: User = User(userName: userData["username"]!, password: userData["password"]!)
            if (savedUser.userName == data.userName && savedUser.password == data.password) {
                delegate?.login(data: savedUser)
            }else{
                clearData()
                delegate?.login(data: nil)
                delegate?.clear()
            }
        }else{
            clearData()
            delegate?.login(data: nil)
            delegate?.clear()
        }
    }
    
    func getLoggedInUser() -> String? {
        let userInfo = userDF.value(forKey: AppDelegate.key)
        if userInfo != nil {
            let userData = userInfo as! [String: String]
            return userData["username"]!
        }else{
            return nil
        }
    }
    
    func clearData() {
        userDF.removeObject(forKey: AppDelegate.key)
    }
}
