//
//  BusinessesTableViewCell.swift
//  Yelp
//
//  Created by Ping Zhang on 10/29/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesTableViewCell: UITableViewCell {

    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var reviewers: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
