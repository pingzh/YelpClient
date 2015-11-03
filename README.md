# YelpClient
Mobile Training Assignment Two

- Written in Swift
- Xcode: 7.1
- Mac OS: 10.10.5
- Hours: 8 hours

Note: Please open `Yelp.xcworkspace`

## Features

### Search results page

    - [x] Table rows is dynamic height according to the content height.
    - [x] Custom cells have the proper Auto Layout constraints.
    - [x] Search bar is in the navigation bar (doesn't have to expand to show location like the real Yelp app does).
 
### Filter page

    - [x] The filters have are: category, sort (best match, distance, highest rated), radius (meters), deals (on/off).
    - [x] The filters table is organized into sections as in the mock.
    - [x] Use the default UISwitch for on/off states.
    - [x] Clicking on the "Search" button dismisses the filters page and trigger the search w/ the new filter settings.
    - [x] Optional: Radius filter expands as in the real Yelp app
    - [x] Optional: Categories shows a subset of the full list with a "See All" row to expand.
    
### Problem:

    - [x] It seems search radius_filter not work as properly, even though I pass raduis_filter into Yelp Api
    
## Gif walkthrough:

![alt tag](https://github.com/pingzh/YelpClient/blob/master/MobileTrainingAssignmentTwo__Ping_Zhang2.gif)

# Credits
- [GIF created with LiceCap] (http://www.cockos.com/licecap/)
- [codepath/ios_yelp_swift] (https://github.com/codepath/ios_yelp_swift)
- [Alamofire] (https://github.com/Alamofire/Alamofire)
- [SwiftyJSON] (https://github.com/SwiftyJSON/SwiftyJSON)
- [CocoaPods] (https://github.com/CocoaPods/CocoaPods)
