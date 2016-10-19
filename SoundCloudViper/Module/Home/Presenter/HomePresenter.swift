//
//  HomePresenter.swift
//  SoundCloudViper
//
//  Created by admin on 19.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class HomePresenter {
    var arrayActivity:[Activity]?
    var interactor:HomeInteractor?
}

extension HomePresenter: HomePresenterProtocol {
    
    func setupHeader(header: HeaderTableViewCell) {
        self.interactor?.setupHeader(header: header)
    }
    
    func numberOfRows() -> Int {
        arrayActivity = self.interactor?.service.arrayActivity
        return (self.arrayActivity?.count)!
    }
    
    func configurationCell(cell: ActivityTableViewCell, indexPath: NSIndexPath) {
        self.interactor?.setupCell(cell: cell, indexPath: indexPath)
    }
    
    func getData(tableView: UITableView, activityIndicator: UIActivityIndicatorView) {
        self.interactor?.service.requestMe(tableView: tableView)
        self.interactor?.service.getDataAboutActivity(tableView: tableView, activityIndicator: activityIndicator)
    }
}
