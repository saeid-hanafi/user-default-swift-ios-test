//
//  LoggedInVC.swift
//  user default test
//
//  Created by Macvps on 4/29/23.
//

import UIKit

class LoggedInVC: UIViewController {
    
    @IBOutlet var usernameLabel: UILabel!
    var userInfo: String! = nil
    let userModel: User_Model = User_Model()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    private func setupView() {
        if (userInfo != nil) {
            usernameLabel.text = userInfo
        }else{
            let loggedinInfo = userModel.getLoggedInUser()
            if loggedinInfo != nil {
                usernameLabel.text = loggedinInfo
            }else{
                self.performSegue(withIdentifier: "falseLogin", sender: self)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ViewController
        destination.loginFailed = "Login Failed!!"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
