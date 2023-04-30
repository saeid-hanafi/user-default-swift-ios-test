//
//  ViewController.swift
//  user default test
//
//  Created by Macvps on 4/29/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    @IBOutlet var userInput: UITextField!
    @IBOutlet var passInput: UITextField!
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var setUserBtn: UIButton!
    @IBOutlet var getUserBtn: UIButton!
    let userModel: User_Model = User_Model()
    var currentUser: User! = nil
    var loginFailed: String! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupView()
        userModel.delegate = self
    }
    
    private func setupView() {
        setInputStyles(input: userInput)
        setInputStyles(input: passInput)
        setBtnCustom(btn: loginBtn)
        setBtnCustom(btn: setUserBtn)
        setBtnCustom(btn: getUserBtn)
        if loginFailed != nil {
            print(loginFailed!)
            userModel.login(data: User(userName: "", password: ""))
        }
    }
    
    private func setInputStyles(input: UITextField) {
        input.layer.borderColor = CGColor(red: 0.1, green: 0.5, blue: 1, alpha: 0.3)
        input.layer.borderWidth = 1
        input.layer.cornerRadius = 10
    }
    
    private func setBtnCustom(btn: UIButton) {
        btn.layer.cornerRadius = 10
        btn.layoutMargins = UIEdgeInsets(top: 10, left: 5, bottom: 5, right: 5)
        btn.layer.borderColor = CGColor(red: 0.3, green: 0.7, blue: 1, alpha: 1)
        btn.layer.borderWidth = 2
    }

    @IBAction func loginBtnAction(_ sender: Any) {
        let username = userInput.text
        let pass = passInput.text
        if (username != "" && pass != "") {
            userModel.login(data: User(userName: username!, password: pass!))
        }else{
            print("Require Fields is empty!!")
        }
        clearData()
    }
    
    @IBAction func getUserBtnAction(_ sender: Any) {
        userModel.getUser()
    }
    
    @IBAction func setUserBtnAction(_ sender: Any) {
        let username: String = userInput.text ?? ""
        let pass: String = passInput.text ?? ""
        if (username != "" && pass != "") {
            userModel.setUser(data: User(userName: username, password: pass))
        }else{
            print("Require Fields Is Empty!!")
        }
        clearData()
    }
    
    private func clearData() {
        userInput.text = ""
        passInput.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! LoggedInVC
        destination.userInfo = currentUser.userName
    }
}

extension ViewController: UserModelDelegate {
    func setUser(data: User) {
        print("New User Seted By Info -> username: \(String(describing: data.userName)) And Pass: \(String(describing: data.password))")
    }
    
    func getUser(data: User) {
        print("userName is : \(data.userName)")
        print("password is : \(data.password)")
    }
    
    func login(data: User?) {
        if data != nil {
            currentUser = data
            self.performSegue(withIdentifier: "trueLogin", sender: self)
        }else{
            print("Username or password is wrong!!")
        }
    }
    
    func fail(error: String) {
        print("Error is : \(error)")
    }
    
    func clear() {
        print("LogOut!!")
    }
}
