//
//  ToDoCellTableViewCell.swift
//  ToDoList
//
//  Created by Malkiel Asher on 4/29/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//

import UIKit

protocol ToDoCellDelegate: class {
     func checkmarkTapped(sender: ToDoCellTableViewCell)
 }

class ToDoCellTableViewCell: UITableViewCell {
    
    weak var delegate: ToDoCellDelegate?
    
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func completeButtonTapped(_ sender: Any) {
        delegate?.checkmarkTapped(sender: self)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
