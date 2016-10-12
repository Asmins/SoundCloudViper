//
//  LoginViewController.swift
//  SoundCloudViper
//
//  Created by admin on 11.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var webViewForLogin: UIWebView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var navigation:LoginWireframe!
    var interactor:LoginInteractor!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        activityIndicator.startAnimating()
        webViewForLogin.sizeToFit()
        self.interactor.startAuthorization(webView: webViewForLogin)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension LoginViewController: UIWebViewDelegate {

    func webViewDidFinishLoad(_ webView: UIWebView) {
        activityIndicator.stopAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return self.interactor.webView(webViewForLogin, shouldStartLoadWith: request, navigationType: navigationType, viewController: self)
    }
}
