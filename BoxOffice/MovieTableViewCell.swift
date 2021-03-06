//
//  MovieTableViewCell.swift
//  BoxOffice
//
//  Created by Hyuhng Min Kim on 2020/07/22.
//  Copyright © 2020 Hyuhng Min Kim. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var movieInfoLabel: UILabel!
    @IBOutlet var movieOpeningDateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
