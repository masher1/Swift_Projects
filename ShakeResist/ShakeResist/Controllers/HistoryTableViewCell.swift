//
//  HistoryTableViewCell.swift
//  ShakeResist
//
//  Created by Malkiel Asher on 5/5/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    func update(with submission: Content){
        let firstWords = submission.content.split(separator: " ")
        let space = " "
        titleLabel.text = String(firstWords[0] + space + firstWords[1] + space)
        titleLabel.text = titleLabel.text! + String(firstWords[2] + space + firstWords[3] + "...")
        
        contentLabel.text = submission.content
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
