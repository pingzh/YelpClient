# YelpClient
Mobile Training Assignment Two

- Written in Swift
- Xcode: 7.1
- Mac OS: 10.10.5
- Hours: 8 hours

Note: Please open `Yelp.xcworkspace`

## Features

- Search results page

    - [x] Table rows should be dynamic height according to the content height.
    - [x] Custom cells should have the proper Auto Layout constraints.
    - [x] Search bar should be in the navigation bar (doesn't have to expand to show location like the real Yelp app does).

        - Hint: This is just a UISearchBar that is set as the navigationItem.titleView
    - Optional: Infinite scroll for restaurant results
    - Optional: Implement map view of restaurant results
- Filter page. Unfortunately, not all the filters in the real Yelp App, are supported in the Yelp API.

    - [x] The filters you should actually have are: category, sort (best match, distance, highest rated), radius (meters), deals (on/off).
    - [x] The filters table should be organized into sections as in the mock.
    - [x] You can use the default UISwitch for on/off states. Optional: implement a custom switch
    - [x] Clicking on the "Search" button should dismiss the filters page and trigger the search w/ the new filter settings.
    - Optional: Radius filter should expand as in the real Yelp app
    - [x] Optional: Categories should show a subset of the full list with a "See All" row to expand.

        - A formatted list of categories available in the Public API can be found here.
    - Optional: Implement the restaurant detail page.
- Problem:

    - [x] seems search radius_filter not work as properly
    - [x]
    
## Gif walkthrough:

![alt tag](https://github.com/pingzh/YelpClient/blob/master/MobileTrainingAssignmentTwo__Ping_Zhang2.gif)

# Credits
- [GIF created with LiceCap] (http://www.cockos.com/licecap/)
- [Alamofire] (https://github.com/Alamofire/Alamofire)
- [SwiftyJSON] (https://github.com/SwiftyJSON/SwiftyJSON)
- [CocoaPods] (https://github.com/CocoaPods/CocoaPods)
