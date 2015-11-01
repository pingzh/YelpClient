//
//  Filter.swift
//  Yelp
//
//  Created by Ping Zhang on 10/31/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import Foundation

class Filter {
    
    var header: String!
    var name: String!
    var options: [Option]!
    var type: FilterType!
    var displayItems: Int!
    var selectedOptionIndex = 0
    
    init(header: String, name: String, options: [Option], type: FilterType, displayItems: Int) {
        self.header = header
        self.name = name
        self.options = options
        self.type = type
        self.displayItems = displayItems
    }
}

enum FilterType {
    case Zero, Single, Multiple
}

class Option {
    var name: String!
    var value: AnyObject!
    var selected: Bool = false
    
    init(name: String, value: AnyObject, selected: Bool = false) {
        self.name = name
        self.value = value
        self.selected = selected
    }
}