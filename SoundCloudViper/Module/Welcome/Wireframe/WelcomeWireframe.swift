//
//  WelcomeWireframe.swift
//  SoundCloudViper
//
//  Created by admin on 11.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class WelcomeWireframe {
    var welcomeViewController: WelcomeViewController?
    var window:UIWindow?
}

extension WelcomeWireframe: WelcomeWireframeProtocol {

    func showSignInView() {
        let welcomeViewController = UIStoryboard.init(name: "Welcome", bundle: nil).instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
        self.welcomeViewController = welcomeViewController
        self.welcomeViewController?.navigation = self
        self.window?.rootViewController = welcomeViewController
        self.window?.makeKeyAndVisible()
    }
    
    func showLoginView() {
        let loginViewController = UIStoryboard.init(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        loginViewController.interactor = LoginInteractor()
        loginViewController.interactor.authenticator = SoundCloudAuthenticator(oauthState: (welcomeViewController?.oauthState)!)
        loginViewController.interactor.navigation = LoginWireframe()
        loginViewController.interactor.navigation?.welcomeViewController = welcomeViewController
        self.welcomeViewController?.present(loginViewController, animated: true, completion: nil)
    }
}
