//
//  CartVCCartTVC.swift
//  RasitFoodFactory
//
//  Created by Rasit on 17.10.2022.
//

import UIKit

class CartVCCartTVC: UITableViewCell {

    @IBOutlet weak var cartVCquantityTextField: UITextField!
    @IBOutlet weak var cartVCImageViewTable: UIImageView!
    @IBOutlet weak var cartVCNameTable: UILabel!
    @IBOutlet weak var cartVCTVPrice: UILabel!
    @IBOutlet weak var cartVCTVTotalLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
