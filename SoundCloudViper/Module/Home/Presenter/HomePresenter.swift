//
//  HomePresenter.swift
//  SoundCloudViper
//
//  Created by admin on 19.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import RxSwift

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
    
    func reguestMe() -> Observable<User> {
        return (self.interactor?.requesMe())!
    }
    
    func getData(activityIndicator: UIActivityIndicatorView) {
      //  self.interactor?.service.requestMe()
        self.interactor?.service.getDataAboutActivity(activityIndicator: activityIndicator)
    }
}
