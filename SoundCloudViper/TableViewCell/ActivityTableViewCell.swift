//
//  ActivityTableViewCell.swift
//  SoundCloudViper
//
//  Created by admin on 11.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {

    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var countTracksLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var activityLabel: UILabel!
    @IBOutlet var imageViewForUser: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
