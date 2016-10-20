//
//  HomePresenter.swift
//  SoundCloudViper
//
//  Created by admin on 19.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomePresenter {
    var data: Driver<[User]>?
    var interactor:HomeInteractor?
}

extension HomePresenter: HomePresenterProtocol {
    
    func setupHeader(header: HeaderTableViewCell) {
  //      self.interactor?.setupHeader(header: header)
    }
    
    func numberOfRows() -> Int {
       // arrayActivity = self.interactor?.service?.arrayActivity
     //   return (self.arrayActivity?.count)!
        print(self.interactor)
        return 0
    }
    
    func configurationCell(cell: ActivityTableViewCell, indexPath: NSIndexPath) {
        self.interactor?.setupCell(cell: cell, indexPath: indexPath)
    }
    
    func reguestMe() {
        self.interactor?.reguestMe()
        data = interactor?.data
    }
    
    func getData(activityIndicator: UIActivityIndicatorView) {
      //  self.interactor?.service.requestMe()
        self.interactor?.service?.getDataAboutActivity(activityIndicator: activityIndicator)
    }
}
