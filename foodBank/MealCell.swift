//
//  MealCell.swift
//  foodBank
//
//  Created by William McPhail on 5/9/22.
//

import UIKit

class MealCell: UITableViewCell {

    @IBOutlet weak var userLabel: UILabel!
    
    @IBOutlet weak var notesLabel: UILabel!

    @IBOutlet weak var mealsStayLabel: UILabel!
    
    @IBOutlet weak var mealsGoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
