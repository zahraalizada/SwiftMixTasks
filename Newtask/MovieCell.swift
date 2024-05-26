//
//  MovieCell.swift
//  Newtask
//
//  Created by Zahra Alizada on 13.05.24.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var actorLabel: UILabel!
    @IBOutlet weak private var soundtrackLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(name: String, actor: String, soundtrack: String) {
        nameLabel.text = name
        actorLabel.text = actor
        soundtrackLabel.text = soundtrack
    }

}
