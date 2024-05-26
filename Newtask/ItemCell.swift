//
//  ItemCell.swift
//  Newtask
//
//  Created by Zahra Alizada on 13.05.24.
//

import UIKit

protocol CustomCellDelegate {
    func didTapGoButton()
}


class ItemCell: UITableViewCell {
    
    var delegate: CustomCellDelegate?
    
    @IBOutlet weak var goBtnOutlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func goBtn(_ sender: Any) {
        delegate?.didTapGoButton()
    }
}
