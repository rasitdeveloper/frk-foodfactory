//
//  PersonTVC.swift
//  RasitFoodFactory
//
//  Created by Rasit on 25.10.2022.
//

import UIKit

class PersonTVC: UITableViewCell {
    
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
