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

    func setupHeader(name:String,nickName:String,followersCount:Int,followingCount:Int,url:String){
        self.labelForUserName.text = name
        self.labelForUserNickName.text = nickName
        self.countFollowersLabel.text = "\(followersCount)"
        self.countFollowingLabel.text = "\(followingCount)"
        let url = URL(string: url)
        self.imageViewForUser.sd_setImage(with: url)
    }
}
