//
//  Filter.swift
//  Yelp
//
//  Created by Ping Zhang on 10/31/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import Foundation

class FilterSection {
    static let filters = [
        Filter(
            header: "",
            name: "deals_filter",
            options: [
                Option(name: "Offering a Deal", value: true, selected: true)
            ],
            type: FilterType.Zero,
            displayItems: 1
        ),
        Filter(
            header: "Distance",
            name: "radius_filter",
            options: [
                Option(name: "Default", value: 1.0),//selected
                Option(name: "0.5 miles", value: 0.5),
                Option(name: "1.0 mile", value: 1.0, selected: true),
                Option(name: "1.5 miles", value: 1.5),
                Option(name: "2.0 miles", value: 2.0),
                Option(name: "5.0 miles", value: 5.0)
            ],
            type: FilterType.Single,
            displayItems: 1
        ),
        Filter(
            header: "Sort By",
            name: "sort",
            options: [
                Option(name: "Default", value: 0),
                Option(name: "Best Match", value: 0, selected: true),
                Option(name: "Distance", value: 1),
                Option(name: "Rating", value: 2)
            ],
            type: FilterType.Single,
            displayItems: 1
        ),
        Filter(
            header: "Category",
            name: "category_filter",
            options: [
                Option(name: "See All", value: "seeall"),
                Option(name: "Afghan", value: "afghani"),
                Option(name: "African", value: "african"),
                Option(name: "American (New)", value: "newamerican"),
                Option(name: "American (Traditional)", value: "tradamerican"),
                Option(name: "Arabian", value: "arabian"),
                Option(name: "Argentine", value: "argentine"),
                Option(name: "Armenian", value: "armenian"),
                Option(name: "Asian Fusion", value: "asianfusion"),
                Option(name: "Australian", value: "australian"),
                Option(name: "Austrian", value: "austrian"),
                Option(name: "Bangladeshi", value: "bangladeshi"),
                Option(name: "Barbeque", value: "bbq"),
                Option(name: "Basque", value: "basque"),
                Option(name: "Belgian", value: "belgian"),
                Option(name: "Brasseries", value: "brasseries"),
                Option(name: "Brazilian", value: "brazilian"),
                Option(name: "Breakfast & Brunch", value: "breakfast_brunch"),
                Option(name: "British", value: "british"),
                Option(name: "Buffets", value: "buffets"),
                Option(name: "Burgers", value: "burgers"),
                Option(name: "Burmese", value: "burmese"),
                Option(name: "Cafes", value: "cafes"),
                Option(name: "Cafeteria", value: "cafeteria"),
                Option(name: "Cajun/Creole", value: "cajun"),
                Option(name: "Cambodian", value: "cambodian"),
                Option(name: "Caribbean", value: "caribbean"),
                Option(name: "Catalan", value: "catalan"),
                Option(name: "Cheesesteaks", value: "cheesesteaks"),
                Option(name: "Chicken Wings", value: "chicken_wings"),
                Option(name: "Chinese", value: "chinese"),
                Option(name: "Comfort Food", value: "comfortfood"),
                Option(name: "Creperies", value: "creperies"),
                Option(name: "Cuban", value: "cuban"),
                Option(name: "Czech", value: "czech"),
                Option(name: "Delis", value: "delis"),
                Option(name: "Diners", value: "diners"),
                Option(name: "Ethiopian", value: "ethiopian"),
                Option(name: "Fast Food", value: "hotdogs"),
                Option(name: "Filipino", value: "filipino"),
                Option(name: "Fish & Chips", value: "fishnchips"),
                Option(name: "Fondue", value: "fondue"),
                Option(name: "Food Court", value: "food_court"),
                Option(name: "Food Stands", value: "foodstands"),
                Option(name: "French", value: "french"),
                Option(name: "Gastropubs", value: "gastropubs"),
                Option(name: "German", value: "german"),
                Option(name: "Gluten-Free", value: "gluten_free"),
                Option(name: "Greek", value: "greek"),
                Option(name: "Halal", value: "halal"),
                Option(name: "Hawaiian", value: "hawaiian"),
                Option(name: "Himalayan/Nepalese", value: "himalayan"),
                Option(name: "Hot Dogs", value: "hotdog"),
                Option(name: "Hot Pot", value: "hotpot"),
                Option(name: "Hungarian", value: "hungarian"),
                Option(name: "Iberian", value: "iberian"),
                Option(name: "Indian", value: "indpak"),
                Option(name: "Indonesian", value: "indonesian"),
                Option(name: "Irish", value: "irish"),
                Option(name: "Italian", value: "italian"),
                Option(name: "Japanese", value: "japanese"),
                Option(name: "Korean", value: "korean"),
                Option(name: "Kosher", value: "kosher"),
                Option(name: "Laotian", value: "laotian"),
                Option(name: "Latin American", value: "latin"),
                Option(name: "Live/Raw Food", value: "raw_food"),
                Option(name: "Malaysian", value: "malaysian"),
                Option(name: "Mediterranean", value: "mediterranean"),
                Option(name: "Mexican", value: "mexican"),
                Option(name: "Middle Eastern", value: "mideastern"),
                Option(name: "Modern European", value: "modern_european"),
                Option(name: "Mongolian", value: "mongolian"),
                Option(name: "Moroccan", value: "moroccan"),
                Option(name: "Pakistani", value: "pakistani"),
                Option(name: "Persian/Iranian", value: "persian"),
                Option(name: "Peruvian", value: "peruvian"),
                Option(name: "Pizza", value: "pizza"),
                Option(name: "Polish", value: "polish"),
                Option(name: "Portuguese", value: "portuguese"),
                Option(name: "Russian", value: "russian"),
                Option(name: "Salad", value: "salad"),
                Option(name: "Sandwiches", value: "sandwiches"),
                Option(name: "Scandinavian", value: "scandinavian"),
                Option(name: "Scottish", value: "scottish"),
                Option(name: "Seafood", value: "seafood"),
                Option(name: "Singaporean", value: "singaporean"),
                Option(name: "Slovakian", value: "slovakian"),
                Option(name: "Soul Food", value: "soulfood"),
                Option(name: "Soup", value: "soup"),
                Option(name: "Southern", value: "southern"),
                Option(name: "Spanish", value: "spanish"),
                Option(name: "Steakhouses", value: "steak"),
                Option(name: "Sushi Bars", value: "sushi"),
                Option(name: "Taiwanese", value: "taiwanese"),
                Option(name: "Tapas Bars", value: "tapas"),
                Option(name: "Tapas/Small Plates", value: "tapasmallplates"),
                Option(name: "Tex-Mex", value: "tex-mex"),
                Option(name: "Thai", value: "thai"),
                Option(name: "Turkish", value: "turkish"),
                Option(name: "Ukrainian", value: "ukrainian"),
                Option(name: "Uzbek", value: "uzbek"),
                Option(name: "Vegan", value: "vegan"),
                Option(name: "Vegetarian", value: "vegetarian"),
                Option(name: "Vietnamese", value: "vietnamese")
            ],
            type: FilterType.Multiple,
            displayItems: 4
        )
        
    ]
}