//
//  TransportationCollectionViewCell.swift
//  HomePage
//
//  Created by Ricky on 17/06/22.
//

import UIKit

class TransportationCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var transportation: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var dataDisplayed: transportation? {
        didSet {
            setupView()
        }
    }
    
    func setupView() {
        if let data = dataDisplayed {
            transportation.setImage(UIImage(systemName: data.image), for: .normal)
            
            if(data.flag == true){
                transportation.tintColor = .brown
            }else{
                transportation.tintColor = .white
            }
            
        }
    }

}
