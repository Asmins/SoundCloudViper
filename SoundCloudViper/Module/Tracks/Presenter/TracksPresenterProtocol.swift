//
//  TracksPresenterProtocol.swift
//  SoundCloudViper
//
//  Created by admin on 19.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

protocol TracksPresenterProtocol {
    func configurationCell(cell:TrackTableViewCell,indexPath:NSIndexPath)
    func getTrackInfo(id:Int,tableView:UITableView)
    func numberOfRows() -> Int
}
