//
//  FirstController.swift
//  Newtask
//
//  Created by Zahra Alizada on 11.05.24.
//

import UIKit

class FirstController: UIViewController, UITableViewDataSource, UITableViewDelegate, CustomCellDelegate {

    @IBOutlet weak var firstLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "First"
     
    }
    
    func didTapGoButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let secondController = storyboard.instantiateViewController(withIdentifier: "SecondController") as? SecondController {
            secondController.callback = { text in
                self.firstLabel.text = text
            }
            navigationController?.show(secondController, sender: nil)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemCell
        cell.delegate = self
        return cell
    }

}
