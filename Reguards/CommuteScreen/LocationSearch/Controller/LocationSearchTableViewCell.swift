//
//  LocationSearchTableViewCell.swift
//  HomePage
//
//  Created by Ricky on 17/06/22.
//

import UIKit

class LocationSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var resultCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    var dataDisplayed: String {
        didSet {
            setupView()
        }
    }
    
    func setupView() {
        if let data = dataDisplayed {
            resultCell.text = data.name
        }
    }
}
