//
//  SettingTableViewCell.swift
//  Reguards
//
//  Created by Ricky on 25/06/22.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    @IBOutlet weak var imageSetting: UIImageView!
    @IBOutlet weak var imageName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var dataDisplayed: setting? {
        didSet {
            setupView()
        }
    }
    
    func setupView() {
        if let data = dataDisplayed {
            imageSetting.image = data.image
            imageName.text = data.name            
        }
    }
    
}
