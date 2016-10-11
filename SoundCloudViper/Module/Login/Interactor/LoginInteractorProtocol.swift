//
//  LoginInteractorProtocol.swift
//  SoundCloudViper
//
//  Created by admin on 11.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

protocol LoginInteractorProtocol: class {
    func didSucceed(authResult: AuthenticationResult)
    func didFail()
    func startAuthorization(webView:UIWebView)
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType,viewController:UIViewController) -> Bool
}


