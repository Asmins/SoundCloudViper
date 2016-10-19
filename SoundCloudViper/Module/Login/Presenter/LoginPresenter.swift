//
//  LoginPresenter.swift
//  SoundCloudViper
//
//  Created by admin on 19.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class LoginPresenter {
    var interactor: LoginInteractor?
}

extension LoginPresenter: LoginPresenterProtocol {

    func startAuthorization(webView: UIWebView, activityIndicator: UIActivityIndicatorView) {
        activityIndicator.startAnimating()
        webView.sizeToFit()
        self.interactor?.startAuthorization(webView: webView)
    }
    
    func loadWebView(webView: UIWebView, request: URLRequest, navigationType: UIWebViewNavigationType, viewController: UIViewController) -> Bool {
       return (self.interactor?.webView(webView, shouldStartLoadWith: request, navigationType: navigationType, viewController: viewController))!
    }
}
