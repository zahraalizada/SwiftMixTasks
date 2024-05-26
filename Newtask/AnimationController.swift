//
//  AnimationController.swift
//  Newtask
//
//  Created by Zahra Alizada on 11.05.24.
//

import UIKit

class AnimationController: UIViewController {

    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var leftConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func animateBtn(_ sender: Any) {
        animationStart()
    }
    
    func animationStart() {
        UIView.animate(withDuration: 2) {
            self.leftConstraint.constant = 250
            self.view.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 2) {
                self.leftConstraint.constant = 20
                self.view.layoutIfNeeded()
            } completion: { _ in
                UIView.animate(withDuration: 2) {
                    self.animationView.alpha = 0
                }
                
            }
        }
        
    }
    


}
