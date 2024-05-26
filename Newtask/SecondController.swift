//
//  SecondController.swift
//  Newtask
//
//  Created by Zahra Alizada on 11.05.24.
//

import UIKit

class SecondController: UIViewController {
    
    var callback: ((String) -> Void)?
    
    @IBOutlet weak var secondField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Second"
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if self.isMovingFromParent {
            callback?(secondField.text ?? "")
        }
        
    }
}
