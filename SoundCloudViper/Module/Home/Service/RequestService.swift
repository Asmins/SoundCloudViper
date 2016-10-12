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
    
    var arrayActivity = [Activity]()
    var user = User()
    var token = UserDefaults()
    
    func requestMe(tableView: UITableView){
        let url = "https://api.soundcloud.com/me.json?oauth_token=\(token.value(forKey: "token") as! String)"
        Alamofire.request(url).responseJSON { response in
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
    
    func getDataAboutActivity(tableView:UITableView,activityIndicator:UIActivityIndicatorView) {
        let url = "https://api.soundcloud.com/me/activities?limit=100&oauth_token=\(token.value(forKey: "token") as! String)"
        Alamofire.request(url).response { response in
            if response.data != nil {
                self.parsDataActivity(data: response.data!, activityIndecator: activityIndicator)
            }
            activityIndicator.stopAnimating()
        }
    }
    
    func parsDataActivity(data:Data,activityIndecator:UIActivityIndicatorView) -> [Activity] {
        activityIndecator.startAnimating()
        let json = JSON(data:data)
        let collection = json["collection"]
        for i in 0..<collection.count{
            let activity = Activity()
            activity.type = collection[i]["type"].stringValue
            let origin = collection[i]["origin"]
            if origin.isEmpty != true {
                let user = origin["user"]
                let time = origin["duration"].int
                let formattedTime = time?.msToSeconds.minuteSecondMS
                activity.duration = formattedTime
                
                switch activity.type! as String{
                case "playlist":
                    activity.trackCount = origin["track_count"].int
                    activity.idPlaylist = origin["id"].int
                case "track":
                    activity.trackCount = 0
                    activity.idTrack = origin["id"].int
                case "track-repost":
                    activity.trackCount = 0
                    activity.idTrack = origin["id"].int
                case "playlist-repost":
                    activity.trackCount = origin["track_count"].int
                    activity.idPlaylist = origin["id"].int
                default:
                    print("Error")
                }
                
                activity.title = origin["title"].stringValue
                activity.userName = user["username"].stringValue
                activity.urlUser = user["avatar_url"].stringValue
                arrayActivity.append(activity)
            }
        }
        activityIndecator.stopAnimating()
        activityIndecator.hidesWhenStopped = true
        return arrayActivity
    }
}

extension TimeInterval {
    var minuteSecondMS: String {
        return String(format:"%d:%02d", minute, second, millisecond)
    }
    var minute: Int {
        return Int(self/60.0) % 60
    }
    var second: Int {
        return Int(self) % 60
    }
    var millisecond: Int {
        return Int(self*1000) % 1000
    }
}

extension Int {
    var msToSeconds: Double {
        return Double(self) / 1000
    }
}
