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
        let homeViewController = UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        homeViewController.presenter = HomePresenter()
       // homeViewController.presenter?.service = RequestService()
        homeViewController.presenter?.interactor = HomeInteractor()
        homeViewController.presenter?.interactor?.service = RequestService()
        homeViewController.navigation = HomeWireframe()
        homeViewController.navigation?.homeViewController = homeViewController
        let navConroller = UINavigationController(rootViewController: homeViewController)
        self.welcomeViewController?.present(navConroller, animated: true, completion: nil)
    }
}
