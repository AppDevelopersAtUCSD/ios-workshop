//
//  MovieCell.swift
//  MovieViewer
//
//  Created by Tejen Hasmukh Patel on 6/4/17.
//  Copyright © 2017 tejen. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var yearLabel: UILabel!
    
    
    var movie: NSDictionary! {
        didSet {
            titleLabel.text = movie["title"] as! String
            yearLabel.text = movie["release_date"] as! String
        }
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
