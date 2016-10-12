//
//  RequestService.swift
//  SoundCloudViper
//
//  Created by admin on 11.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RequestService {
    
    var user = User()
    var token = UserDefaults()
    
    func requestMe(tableView: UITableView){
        Alamofire.request("https://api.soundcloud.com/me.json?oauth_token=\(token.value(forKey: "token") as! String)").responseJSON { response in
            if response.data != nil {
                self.parsData(data: response.data!)
            }
            tableView.reloadData()
        }
    }
    
    func parsData(data:Data)  {
        let json = JSON(data: data as Data)
        user.fullName = json["full_name"].stringValue
        user.nickName = json["username"].stringValue
        user.url = json["avatar_url"].stringValue
        user.followersCount = json["followers_count"].int
        user.followingCount = json["followings_count"].int
    }
}
