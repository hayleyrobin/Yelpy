//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // ––––– TODO: Add storyboard Items (i.e. tableView + Cell + configurations for Cell + cell outlets)

    // ––––– TODO: Next, place TableView outlet here
    @IBOutlet weak var tableView: UITableView!
    // –––––– TODO: Initialize restaurantsArray
    
    // placeholder for storing all data from API request
    var restaurantsArray: [[String:Any?]] = []
    
    // ––––– TODO: Add tableView datasource + delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 150
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getAPIData()
    }
    
    //tells the table view how many rows, or cells in this case, to create. How many cells do we want? Well, as many as we have restaurants.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Create restaurant cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell") as! RestaurantCell
        
        let restaurant = restaurantsArray[indexPath.row]
        
        // set restuarant label
        cell.restaurantLabel.text = restaurant["name"] as? String ?? ""
        
        
        // set image of restaurant
        if let imageUrlString = restaurant["image_url"] as? String{
            let imageUrl = URL(string: imageUrlString)
            cell.restaurantImage.af.setImage(withURL: imageUrl!)
        }
        
        //set ratings & ratings count
        let reviews = restaurant["review_count"] as? Int
        cell.ratingsCountLabel.text = String(reviews!)
        
        let ratings_ = restaurant["rating"] as? Float
        
        // set category for restaurant
        //let category = restaurant["categories"] as? NSArray

                        
        //let category = restaurant["categories"] as! NSArray
        
        //let catTitle = category![0] as! String
       // let title_ = catTitle[title] as! String
        
        // set phone number for restaurant
        cell.phoneLabel.text = restaurant["display_phone"] as? String
        
        
        return cell
    }
    
    // ––––– TODO: Get data from API helper and retrieve restaurants
    func getAPIData(){
        API.getRestaurants() { (restaurants) in
            guard let restaurants = restaurants else{
                return
            }
            print(restaurants)
            self.restaurantsArray = restaurants
            self.tableView.reloadData() //reload data
        }
    }

}

// ––––– TODO: Create tableView Extension and TableView Functionality


