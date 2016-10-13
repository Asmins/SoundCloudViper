//
//  TracksInteractor.swift
//  SoundCloudViper
//
//  Created by admin on 11.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import SDWebImage

class TracksInteractor {
    var service = TracksService()
}

extension TracksInteractor: TracksInteractorProtocol {
    func getTrackInfo(id:Int,tableView:UITableView) {
        self.service.getTrackInfo(idPlayList:id, tableView:tableView)
    }
    
    func setupCell(cell: TrackTableViewCell,indexPath:NSIndexPath) {
        cell.durationLabel.text = service.arrayTracks[indexPath.row].time
        cell.titleLabel.text = service.arrayTracks[indexPath.row].title
        cell.subTitleLabel.text = service.arrayTracks[indexPath.row].subTitle
        let url = NSURL(string: service.arrayTracks[indexPath.row].urlImage)
        cell.imageViewForPhotoAlbum.sd_setImage(with: url as URL!)
    }
}
