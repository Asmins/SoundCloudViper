//
//  TracksInteractor.swift
//  SoundCloudViper
//
//  Created by admin on 11.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SDWebImage

class TracksInteractor {
    var idPlayLists = Variable("")
    var track:Driver<[Track]>?
    var service:TracksService?
}

extension TracksInteractor: TracksInteractorProtocol {
    
    func getTrackInfo(id:String) {
        let service = TracksService()
        self.service = service

        idPlayLists = Variable(id)
        
        track = idPlayLists.asObservable()
            .throttle(0.3, scheduler: MainScheduler.instance)
            .distinctUntilChanged().flatMapLatest{
                service.getTrackInfo(idPlayList: $0)
            }.asDriver(onErrorJustReturn: [])
    }
}
