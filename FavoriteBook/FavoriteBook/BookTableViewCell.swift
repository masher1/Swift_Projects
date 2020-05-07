//
//  BookTableViewCell.swift
//  FavoriteBooks
//
//  Created by Malkiel Asher on 4/16/20.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
        
    
    func update(with book: Book){
        titleLabel.text = book.title
        authorLabel.text = book.author
        genreLabel.text = book.genre
        lengthLabel.text = book.length
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
