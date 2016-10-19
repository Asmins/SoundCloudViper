//
//  HomePresenterProtocol.swift
//  SoundCloudViper
//
//  Created by admin on 19.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import RxSwift

protocol HomePresenterProtocol {
    func getData(activityIndicator:UIActivityIndicatorView)
    func configurationCell(cell:ActivityTableViewCell,indexPath:NSIndexPath)
    func numberOfRows() -> Int
    func setupHeader(header:HeaderTableViewCell)
    func reguestMe() ->Observable<User>
}
