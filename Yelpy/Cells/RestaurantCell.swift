//
//  RestaurantCell.swift
//  Yelpy
//
//  Created by Hayley Robinson on 2/25/21.
//  Copyright © 2021 memo. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {

    @IBOutlet weak var restaurantLabel: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var ratingsImage: UIImageView!
    @IBOutlet weak var ratingsCountLabel: UILabel!
    
    // Add movie variable + didset
    var r: Restaurant!{
        didSet {
            restaurantLabel.text = r.name
            categoryLabel.text = r.mainCategory
            phoneLabel.text = r.phone
            ratingsCountLabel.text = String(r.reviews)
            
            // set images
            ratingsImage.image = Stars.dict[r.rating]!
            restaurantImage.af.setImage(withURL: r.imageURL!)
            restaurantImage.layer.cornerRadius = 10
                restaurantImage.clipsToBounds = true
            
        }
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
