//
//  ViewController.swift
//  user default test
//
//  Created by Macvps on 4/29/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var userInput: UITextField!
    
    @IBOutlet var passInput: UITextField!
    
    @IBOutlet var loginBtn: UIButton!
    
    @IBOutlet var getUserBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupView()
    }
    
    private func setupView() {
        setInputStyles(input: userInput)
        setInputStyles(input: passInput)
        setBtnCustom(btn: loginBtn)
        setBtnCustom(btn: getUserBtn)
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
    }
    
    @IBAction func getUserBtnAction(_ sender: Any) {
    }
}

