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
    var searchString: String = "Restaurants"
    
    @IBAction func saveFilterResult(segue:UIStoryboardSegue) {
        let filterViewController = segue.sourceViewController as! FilterViewController
        self._search(
            self.searchString,
            sort: filterViewController.sort,
            radius_filter: filterViewController.radius_filter,
            categories: Array(filterViewController.category_filter),
            deals: filterViewController.deals_filter
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self._setupSearchController()
        self._setupTableView()
        self._search()
    }
    
    func showFilter() {
        //the line below it is very important
        self.dismissViewControllerAnimated(true, completion: nil)
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.searchBarCancelButtonClicked(searchController.searchBar)
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchController.searchBar.showsCancelButton = false
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
        cell.category.text = business.categories
        
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
    
    func _search(keyword: String = "Restaurants", sort: Int = 1, radius_filter: Double = 1.0, categories: [String] = [], deals: Bool = false) {
        let sortModel = YelpSortMode(rawValue: sort)
        Business.searchWithTerm(keyword, sort: sortModel, radius_filter: radius_filter, categories: categories, deals: deals) { (businesses: [Business]!, error: NSError!) -> Void in
            self.businesses = businesses
            self.tableView.reloadData()
        }
    }
}


