//
//  FootballCell.swift
//  Newtask
//
//  Created by Zahra Alizada on 13.05.24.
//

import UIKit

class FootballCell: UITableViewCell {

    @IBOutlet weak private var footballerLabel: UILabel!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var teamImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(name: String, footballer: String, image: String) {
        nameLabel.text = name
        footballerLabel.text = footballer
        teamImage.image = UIImage(named: image)
    }

}
