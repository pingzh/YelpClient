//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UIScrollViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var searchController: UISearchController!
    var businesses: [Business] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self._setupSearchController()
        self._setupTableView()
        self._search()
    }
    
    
    func showFilter() {
        self.performSegueWithIdentifier("BusinessesToFilter", sender: self)
    }
    

/**** UISearchController ****/
    func _setupSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        searchController.searchBar.placeholder = "Restaurants"
        //this is used to cancel button
        searchController.searchBar.delegate = self
        
        navigationItem.titleView = searchController.searchBar
        searchController.hidesNavigationBarDuringPresentation = false
        
        let leftBarItem = UIBarButtonItem(title: "Filter", style: .Plain, target: self, action: Selector("showFilter"))
        navigationItem.leftBarButtonItem = leftBarItem
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchText = searchController.searchBar.text
        if searchText != nil && searchText != ""{
            print(searchText)
            self._search(searchText!)
        }
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self._search()
    }
/**** End UISearchController ****/

     
/**** UITableView ****/
    func _setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 150
    }


    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.businesses.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BusinessesCell", forIndexPath: indexPath) as! BusinessesTableViewCell
        
        let business = self.businesses[indexPath.row]
        
        cell.name.text = business.name
        cell.distance.text = business.distance
        cell.address.text = business.address
        cell.reviewers.text = business.reviewCount?.description
        
        if let imageUrl = business.imageURL?.description {
            Images.downloadThumbnailImage(imageUrl,  uiImageView: cell.thumbnailImageView)
        }
        
        if let ratingImageUrl = business.ratingImageURL?.description {
            Images.downloadThumbnailImage(ratingImageUrl, uiImageView: cell.ratingImageView)
        }
        
        return cell
    }
    
/**** End UITableView ****/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func _search(keyword: String = "Restaurants") {
        Business.searchWithTerm(keyword, sort: .Distance, categories: nil, deals: nil) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
        }
    }
}


//        Business.searchWithTerm("Thai", completion: { (businesses: [Business]!, error: NSError!) -> Void in
//            self.businesses = businesses
//
//            for business in businesses {
//                println(business.name!)
//                println(business.address!)
//            }
//        })

//

