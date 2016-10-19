//
//  WelcomeViewController.swift
//  SoundCloudViper
//
//  Created by admin on 11.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    var navigation = WelcomeWireframe()
    
    let oauthState = OAuthState(
        clientId: "7467688f360c6055fb679c3bd739acbc",
        clientSecret:"8cd5fb0bd4653074d8b6b6a352d81ac5",
        redirectUri: "soundcloud://soundcloud/callback",
        responseType: OAuthResponseType.Token)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func signInButton(_ sender: AnyObject) {
        self.navigation.showLoginView()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
