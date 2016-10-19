//
//  User.swift
//  SoundCloudViper
//
//  Created by admin on 12.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import SwiftyJSON

class User {
    var fullName: String?
    var nickName: String?
    var url: String?
    var followersCount: Int?
    var followingCount: Int?

    init(json:JSON) {
        self.url = json["avatar_url"].stringValue
        self.fullName = json["full_name"].stringValue
        self.nickName = json["username"].stringValue
        self.followersCount = json["followers_count"].int
        self.followingCount = json["followings_count"].int
    }

    init(){
        
    }
}
