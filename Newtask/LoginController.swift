//
//  LoginController.swift
//  Newtask
//
//  Created by Zahra Alizada on 13.05.24.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    let user = User(fullname: "Zahra Alizada", email: "zahra@gmail.com", password: "123")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        
        emailField.text = "zahra@gmail.com"
        passwordField.text = "123"
        errorLabel.isHidden = true
    }
    
 
    @IBAction func loginButton(_ sender: Any) {
        
        UserDefaults.standard.setValue(true, forKey: "userRegistered")
        
        let password = passwordField.text
        let email = emailField.text
        
        if email == user.email && password == user.password {
            let controller = storyboard?.instantiateViewController(identifier: "\(HomeController.self)") as! HomeController
            controller.user = user
            navigationController?.show(controller, sender: nil)
        } else {
            errorLabel.text = "Incorrect email or password!"
            errorLabel.isHidden = false
        }
        
        
    }
    
}
