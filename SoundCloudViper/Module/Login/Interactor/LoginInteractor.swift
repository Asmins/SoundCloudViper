//
//  LoginInteractor.swift
//  SoundCloudViper
//
//  Created by admin on 11.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class LoginInteractor {
    
    var authenticator:SoundCloudAuthenticator?
    var navigation:LoginWireframe?
}

extension LoginInteractor: LoginInteractorProtocol {
    
    func didFail() {
        print("Fails")
    }
    
    func didSucceed(authResult: AuthenticationResult) {
        self.navigation?.showHomeViewController()
        print("From interactor")
    }

    func startAuthorization(webView:UIWebView) {
        if let authenticator = self.authenticator{
            let url = authenticator.buildLoginURL()
            webView.loadRequest(NSURLRequest(url: url as URL) as URLRequest)
        }
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType,viewController:UIViewController) -> Bool {
      //  print(navigation)
        let url = request.url!
        if let authenticator = self.authenticator , authenticator.isOAuthResponse(url: url as NSURL) {
            viewController.dismiss(animated: true, completion: {
                if let authResult = authenticator.resultFromAuthenticationResponse(url: url as NSURL) {
                    self.didSucceed(authResult: authResult)
                }else{
                    self.didFail()
                }
            })
        }
        return true
    }
}
