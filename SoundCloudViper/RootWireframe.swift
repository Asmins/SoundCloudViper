//
//  RootWireframe.swift
//  SoundCloudViper
//
//  Created by admin on 11.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class RootWireframe {
    
    let welcomeWireframe = WelcomeWireframe()
    
    func application(didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?,window:UIWindow) -> Bool {
        self.welcomeWireframe.window = window
        self.welcomeWireframe.showSignInView()
        return true
    }

    
}
