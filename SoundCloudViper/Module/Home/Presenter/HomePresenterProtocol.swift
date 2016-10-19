//
//  HomePresenterProtocol.swift
//  SoundCloudViper
//
//  Created by admin on 19.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

protocol HomePresenterProtocol {
    func getData(tableView:UITableView,activityIndicator:UIActivityIndicatorView)
    func configurationCell(cell:ActivityTableViewCell,indexPath:NSIndexPath)
    func numberOfRows() -> Int
    func setupHeader(header:HeaderTableViewCell)
}
