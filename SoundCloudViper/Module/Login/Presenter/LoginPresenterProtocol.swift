//
//  LoginPresenterProtocol.swift
//  SoundCloudViper
//
//  Created by admin on 19.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

protocol LoginPresenterProtocol {
    func loadWebView(webView:UIWebView,request:URLRequest,navigationType: UIWebViewNavigationType,viewController:UIViewController) -> Bool
    func startAuthorization(webView:UIWebView,activityIndicator:UIActivityIndicatorView)
}
