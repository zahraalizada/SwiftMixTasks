//
//  HomeController.swift
//  Newtask
//
//  Created by Zahra Alizada on 13.05.24.
//

import UIKit

class HomeController: UIViewController {
    
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
    }

    @IBAction func goprofileButton(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(identifier: "\(ProfileController.self)") as! ProfileController
        controller.user = user
        navigationController?.show(controller, sender: nil)
    }
}
