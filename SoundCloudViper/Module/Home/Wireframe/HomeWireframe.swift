//
//  HomeWireframe.swift
//  SoundCloudViper
//
//  Created by admin on 11.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class HomeWireframe {
    var homeViewController:HomeViewController?
}

extension HomeWireframe: HomeWireframeProtocol {
   
    func showTrackViewController(title: String, id: Int) {
       let controller = UIStoryboard.init(name: "Tracks", bundle: nil).instantiateViewController(withIdentifier: "TracksViewController") as! TracksViewController
        controller.title = title
        controller.id = id
        controller.interactor = TracksInteractor()
        homeViewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func showPlayerViewController() {
        print("Show player view controller")
    }
}
