//
//  ViewController.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import UIKit
import AlamofireImage

class RestaurantsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    // ––––– TODO: Add storyboard Items (i.e. tableView + Cell + configurations for Cell + cell outlets)

    // ––––– TODO: Next, place TableView outlet here
    @IBOutlet weak var tableView: UITableView!
  
    var isMoreDataLoading = false
    
    // placeholder for storing all data from API request
    var restaurantsArray: [Restaurant] = []
    
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
        
        //refactoring all this to 4 lines! Set the cell's r variable to the restaurant object from indexPath.
        cell.r = restaurant
       
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
//
//    func loadMoreData() {
//
//        // ... Create the NSURLRequest (myRequest) ...
//        let myRequest = URL(string: "https://api.yelp.com/v3/transactions/delivery/search?latitude=\(37.773972)&longitude=\(-122.431297)")
//        // Configure session so that completion handler is executed on main UI thread
//        let session = URLSession(configuration: URLSessionConfiguration.default,
//                                delegate:nil,
//                                delegateQueue:OperationQueue.main
//        )
//        let task : URLSessionDataTask = session.dataTask(with: myRequest!, completionHandler: { (data, response, error) in
//
//            // Update flag
//            self.isMoreDataLoading = false
//
//            // ... Use the new data to update the data source ...
//
//            // Reload the tableView now that there is new data
//            self.tableView.reloadData()
//        })
//        task.resume()
//    }
//
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        // Handle scroll behavior here
//        if (!isMoreDataLoading) {
//            // Calculate the position of one screen length before the bottom of the results
//            let scrollViewContentHeight = tableView.contentSize.height
//            let scrollOffsetThreshold = scrollViewContentHeight - tableView.bounds.size.height
//
//            // When the user has scrolled past the threshold, start requesting
//            if(scrollView.contentOffset.y > scrollOffsetThreshold && tableView.isDragging) {
//                isMoreDataLoading = true
//
//            loadMoreData()
//        }
//    }
//
//    }

    // TODO: Override segue to pass the restaurant object to the DeatilsViewController

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell){
            let r = restaurantsArray[indexPath.row]
            let detailViewController = segue.destination as! RestaurantDetailViewController
            detailViewController.r = r
        }
    }
}

// ––––– TODO: Create tableView Extension and TableView Functionality




