//
//  ProfileController.swift
//  Newtask
//
//  Created by Zahra Alizada on 13.05.24.
//

import UIKit

class ProfileController: UIViewController {

    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        
        if let user = user {
            fullnameLabel.text = "Name: \(user.fullname ?? "")"
            emailLabel.text = "Email: \(user.email ?? "")"
            passwordLabel.text = "Password: \(user.password ?? "")"
        }
    }

    @IBAction func logoutButton(_ sender: Any) {
        let scene = UIApplication.shared.connectedScenes.first
        if let sceneDelegate: SceneDelegate = scene?.delegate as? SceneDelegate {
            sceneDelegate.setLoginAsRoot()
        }
    }
    
}
