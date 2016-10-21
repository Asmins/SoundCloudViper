//
//  TracksPresenter.swift
//  SoundCloudViper
//
//  Created by admin on 19.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class TracksPresenter {
    var track:Driver<[Track]>?
  
    var interactor:TracksInteractor?
}

extension TracksPresenter: TracksPresenterProtocol {
   
    func getTrackInfo(id:String) {
        self.interactor?.getTrackInfo(id: id)
        track = interactor?.track
    }
}
