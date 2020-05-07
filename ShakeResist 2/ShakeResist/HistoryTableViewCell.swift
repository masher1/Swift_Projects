//
//  HistoryTableViewCell.swift
//  ShakeResist
//
//  Created by Malkiel Asher on 5/5/20.
//  Copyright © 2020 Malkiel Asher. All rights reserved.
//
/*
File Description: This file is responsible for creating and maintaning the view of the dynamic HistoryCell
*/

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    func update(with submission: Submission){
        titleLabel.text = submission.title
        contentLabel.text = submission.content
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
