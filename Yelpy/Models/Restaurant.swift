//
//  Restaurant.swift
//  Yelpy
//
//  Created by Hayley Robinson on 4/2/21.
//  Copyright © 2021 memo. All rights reserved.
//

import Foundation

// Allows cells to update its properties more efficiently
class Restaurant {
    
    // Lab 2 TODO: Establish Properties
    var imageURL:URL?
    var url: URL?
    var name: String
    var mainCategory: String
    var phone: String
    var rating: Double
    var reviews: Int
    
    // Lab 2 TODO: COmplete initializer for Restaurant
    init(dict: [String: Any]){
        imageURL = URL(string: dict["image_url"] as! String)
        name = dict["name"] as! String
        rating = dict["rating"] as! Double
        reviews = dict["review_count"] as! Int
        phone = dict["display_phone"] as! String
        url = URL(string: dict["url"] as! String)
        mainCategory = Restaurant.getMainCategory(dict: dict)
    }
    
    // Helper dunction to get first category from restaurant
    static func getMainCategory(dict: [String:Any])-> String{
        let categories = dict["categories"] as! [[String: Any]]
        return categories[0]["title"] as! String
    }
    
}
