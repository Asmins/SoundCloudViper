//
//  TrackService.swift
//  SoundCloudViper
//
//  Created by admin on 12.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import Alamofire
import RxCocoa
import RxSwift
import RxAlamofire
import SwiftyJSON

class TracksService {

    func getTrackInfo(idPlayList:String) -> Observable<[Track]>{
        let url = URL(string:"https://api.soundcloud.com/playlists/\(idPlayList)/tracks?client_id=7467688f360c6055fb679c3bd739acbc")
        return json(.get, url!).retry(3).map { data in
            var track = [Track]()
            let json = JSON(data)
            for i in 0..<json.count {
                let title = json[i]["user"]["username"].stringValue
                let subTitle = json[i]["title"].stringValue
                let time = json[i]["duration"].int
                let formattedDuration = time?.msToSeconds.minuteSecondMS
                let url = json[i]["user"]["avatar_url"].stringValue
                let trackId = json[i]["id"].int
                track.append(Track(idTrack: trackId!, time: formattedDuration!, title: title, subTitle: subTitle, urlImage: url))
            }
            return track
        }
    }
}
