//
//  HeaderTableViewCell.swift
//  SoundCloudViper
//
//  Created by admin on 11.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import SDWebImage

class HeaderTableViewCell: UITableViewHeaderFooterView {

    @IBOutlet var countFollowingLabel: UILabel!
    @IBOutlet var countFollowersLabel: UILabel!
    @IBOutlet var labelForUserNickName: UILabel!
    @IBOutlet var labelForUserName: UILabel!
    @IBOutlet var imageViewForUser: UIImageView!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewForUser.clipsToBounds = true
        imageViewForUser.layer.masksToBounds = true
        imageViewForUser.layoutIfNeeded()
    }

    func setupHeader(user:User){
        self.labelForUserName.text = user.fullName
        self.labelForUserNickName.text = user.nickName
        self.countFollowersLabel.text = "\(user.followersCount)"
        self.countFollowingLabel.text = "\(user.followingCount)"
        let url = URL(string: user.url)
        self.imageViewForUser.sd_setImage(with: url)
    }
}
