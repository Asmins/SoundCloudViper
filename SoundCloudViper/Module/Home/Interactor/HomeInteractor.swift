//
//  HomeInteractor.swift
//  SoundCloudViper
//
//  Created by admin on 11.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeInteractor {
    var data: Driver<[User]>?
    let text = UserDefaults()
    var token = Variable("")
    var service:RequestService!

}

extension HomeInteractor: HomeInteractorProtocol {
    
    func getData(tableView: UITableView, activityIndecator: UIActivityIndicatorView) {
        print("sdfsfdaw")
        // self.service.
    }
    
    func reguestMe() {
        let service = RequestService()
        self.service = service
        token = Variable("\(text.value(forKey: "token") as! String)")
        print(token.value)
        data = self.token.asObservable()
        .throttle(0.3, scheduler: MainScheduler.instance)
            .distinctUntilChanged().flatMapLatest{
                service.requestMe(token: $0)
            }.asDriver(onErrorJustReturn: [])
    }
    /*
    func setupHeader(header: HeaderTableViewCell) {
        if service?.user.followersCount != nil {
            header.labelForUserName.text = service?.user.fullName
            header.labelForUserNickName.text = service?.user.nickName
            header.countFollowersLabel.text = "\((service?.user.followersCount!)! as Int)"
            header.countFollowingLabel.text = "\((service?.user.followingCount!)! as Int)"
            let url = NSURL(string:(service?.user.url)!)
            header.imageViewForUser.sd_setImage(with: url as URL!)
        }
    }
    */
    func setupCell(cell: ActivityTableViewCell, indexPath: NSIndexPath) {
        cell.activityLabel.text = "\((service?.arrayActivity[indexPath.row].userName!)! as String) posted a new \((service?.arrayActivity[indexPath.row].type!)! as String)"
        cell.durationLabel.text = service?.arrayActivity[indexPath.row].duration
        cell.titleLabel.text = service?.arrayActivity[indexPath.row].userName
        cell.subTitleLabel.text = service?.arrayActivity[indexPath.row].title
        
        if service?.arrayActivity[indexPath.row].trackCount != 0 {
            cell.view.isHidden = false
            cell.idPlayList = service?.arrayActivity[indexPath.row].idPlaylist
            cell.countTracksLabel.text = "\((service?.arrayActivity[indexPath.row].trackCount!)! as Int)"
        }else{
            cell.view.isHidden = true
            cell.countTracksLabel.text = ""
        }
        let url = NSURL(string: (service?.arrayActivity[indexPath.row].urlUser!)!)
        cell.mainImageView.sd_setImage(with: url as URL!)
        cell.imageViewForUser.sd_setImage(with: url as URL!)
    }
    
}
