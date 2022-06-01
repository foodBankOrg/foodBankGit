//
//  MealCell.swift
//  foodBank
//
//  Created by Mia Elena on 5/25/22.
//

import UIKit

class MealCell: UITableViewCell {
    
    @IBOutlet weak var guestName: UILabel!
    @IBOutlet weak var guestNotes: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
