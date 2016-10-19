//
//  HomeInteractorProtocol.swift
//  SoundCloudViper
//
//  Created by admin on 11.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import RxSwift

protocol HomeInteractorProtocol {
    func requesMe() -> Observable<User>
    func getData(activityIndecator:UIActivityIndicatorView)
    func setupHeader(header:HeaderTableViewCell)
    func setupCell(cell:ActivityTableViewCell,indexPath:NSIndexPath)
}
