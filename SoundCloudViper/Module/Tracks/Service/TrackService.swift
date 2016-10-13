//
//  TrackService.swift
//  SoundCloudViper
//
//  Created by admin on 12.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TracksService {

    var arrayTracks = [Track]()
    
    func getTrackInfo(idPlayList:Int,tableView:UITableView){
        let url = "https://api.soundcloud.com/playlists/\(idPlayList)/tracks?client_id=7467688f360c6055fb679c3bd739acbc"
        Alamofire.request(url).responseJSON{ response in
            if response.data != nil {
                self.parsData(data: response.data!)
            }
            tableView.reloadData()
        }
    }
    
    func parsData(data:Data) {
        let json = JSON(data:data)
        print(json)
        for i in 0..<json.count{
            let track = Track()
            track.title = json[i]["user"]["username"].stringValue
            track.subTitle = json[i]["title"].stringValue
            let time = json[i]["duration"].int
            let formattedTime = time!.msToSeconds.minuteSecondMS
            track.time = formattedTime
            track.urlImage = json[i]["user"]["avatar_url"].stringValue
            track.idTrack = json[i]["id"].int
            arrayTracks.append(track)
        }
    }
}
