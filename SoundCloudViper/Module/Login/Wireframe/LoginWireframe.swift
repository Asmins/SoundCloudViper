//
//  LoginWireframe.swift
//  SoundCloudViper
//
//  Created by admin on 11.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class LoginWireframe {
    var welcomeViewController:WelcomeViewController?
}

extension LoginWireframe: LoginWireframeProtocol {

    func showHomeViewController() {
        print("Print from Wireframe")
        let homeViewController = UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        homeViewController.interactor = HomeInteractor()
        homeViewController.navigation = HomeWireframe()
        homeViewController.navigation?.homeViewController = homeViewController
        self.welcomeViewController?.present(homeViewController, animated: true, completion: nil)
        //self.loginViewController?.present(homeViewController, animated: true, completion: nil)
    }
}
