//
//  NewsTableViewCell.swift
//  NewsApI
//
//  Created by krutika on 2/17/21.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titlelbl : UILabel!
    @IBOutlet weak var descriptionLbl : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
