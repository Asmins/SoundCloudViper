//
//  HomeWireframe.swift
//  SoundCloudViper
//
//  Created by admin on 11.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import Foundation

class HomeWireframe {
    var homeViewController:HomeViewController?
}

extension HomeWireframe: HomeWireframeProtocol {
   
    func showTrackViewController() {
        print("Show tracks view controller")
    }
    func showPlayerViewController() {
        print("Show player view controller")
    }
}
