//
//  HeaderTableViewCell.swift
//  SoundCloudViper
//
//  Created by admin on 11.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewHeaderFooterView {

    @IBOutlet var countFollowingLabel: UILabel!
    @IBOutlet var countFollowersLabel: UILabel!
    @IBOutlet var labelForUserNickName: UILabel!
    @IBOutlet var labelForUserName: UILabel!
    @IBOutlet var imageViewForUser: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       // imageViewForUser.layer.cornerRadius = imageViewForUser.frame.size.height / 2
        imageViewForUser.clipsToBounds = true
        imageViewForUser.layer.masksToBounds = true
        imageViewForUser.layoutIfNeeded()
        // Initialization code
    }

}
