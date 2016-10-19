//
//  TracksPresenter.swift
//  SoundCloudViper
//
//  Created by admin on 19.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class TracksPresenter {
    var arrayTracks:[Track]!
    var interactor:TracksInteractor?
}

extension TracksPresenter: TracksPresenterProtocol {
    func configurationCell(cell: TrackTableViewCell, indexPath: NSIndexPath) {
        self.interactor?.setupCell(cell: cell, indexPath: indexPath)
    }
    
    func getTrackInfo(id: Int, tableView: UITableView) {
        self.interactor?.getTrackInfo(id: id, tableView: tableView)
    }
    
    func numberOfRows() -> Int {
        arrayTracks = self.interactor?.service.arrayTracks
        return (arrayTracks?.count)!
    }
}
