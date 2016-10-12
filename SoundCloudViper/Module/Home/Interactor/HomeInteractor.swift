//
//  HomeInteractor.swift
//  SoundCloudViper
//
//  Created by admin on 11.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class HomeInteractor {
   var service = RequestService()
}

extension HomeInteractor: GetDataAboutUser {
    
    func getData(tableView:UITableView,activityIndecator:UIActivityIndicatorView){
        service.requestMe(tableView: tableView)
        service.getDataAboutActivity(tableView: tableView, activityIndicator: activityIndecator)
    }
    
    func setupHeader(header: HeaderTableViewCell) {
        if service.user.followersCount != nil {
            header.labelForUserName.text = service.user.fullName
            header.labelForUserNickName.text = service.user.nickName
            header.countFollowersLabel.text = "\(service.user.followersCount! as Int)"
            header.countFollowingLabel.text = "\(service.user.followingCount! as Int)"
            let url = NSURL(string:(service.user.url)!)
            header.imageViewForUser.sd_setImage(with: url as URL!)
        }
    }
}
