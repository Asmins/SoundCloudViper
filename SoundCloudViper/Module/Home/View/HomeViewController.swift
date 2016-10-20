//
//  HomeViewController.swift
//  SoundCloudViper
//
//  Created by admin on 11.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SDWebImage

class HomeViewController: UIViewController {
    
    @IBOutlet var tableVIew: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var navigation: HomeWireframe?
    var presenter: HomePresenter?
    
    var token = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        print(token.value(forKey: "token"))
        self.title = "FEED"
        self.navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 255/255, green: 116/255, blue: 0/255, alpha: 1)
        self.setupTableView(tableView: tableVIew)
        self.presenter?.reguestMe()
        /*
         self.presenter?.data?.drive(tableVIew.rx.items(cellIdentifier: "Header")) {_,user,header in
         
         }
         */
        
        self.presenter?.data?.drive(tableVIew.rx_itemsWithCellFactory) {tableView,row,user in
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as! HeaderTableViewCell
            header.setupHeader(name: user.fullName, nickName: user.fullName, followersCount: user.followersCount, followingCount: user.followingCount, url: user.url)
            tableView.tableHeaderView = header
            tableView.sectionHeaderHeight = 60
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell") as! ActivityTableViewCell
            cell.subTitleLabel.text = user.nickName
            cell.titleLabel.text = user.fullName
            return cell
        }
    }
    
    
    
}

/*
 extension HomeViewController: UITableViewDataSource {
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell") as! ActivityTableViewCell
 self.presenter?.configurationCell(cell: cell, indexPath: indexPath as NSIndexPath)
 return cell
 }
 
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 return (self.presenter?.numberOfRows())!
 }
 }
 
 extension HomeViewController: UITableViewDelegate {
 
 func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
 let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as! HeaderTableViewCell
 self.presenter?.setupHeader(header: header)
 return header
 }
 
 func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
 return CGFloat(60)
 }
 
 func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
 return CGFloat(200)
 }
 /*
 func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 let cell = tableView.cellForRow(at: indexPath) as! ActivityTableViewCell
 switch (self.presenter?.arrayActivity?[indexPath.row].type!)! as String {
 case "playlist":
 self.navigation!.showTrackViewController(title: cell.subTitleLabel.text!, id: cell.idPlayList)
 case "playlist-repost":
 self.navigation!.showTrackViewController(title: cell.subTitleLabel.text!, id: cell.idPlayList)
 case "track":
 self.navigation?.showPlayerViewController()
 case "track-repost":
 self.navigation?.showPlayerViewController()
 default:
 print("Error")
 }
 tableView.deselectRow(at: indexPath, animated: true)
 }*/
 }
 */

extension HomeViewController {
    func setupTableView(tableView:UITableView) {
        tableView.register(UINib.init(nibName: "HeaderTableView", bundle: nil), forHeaderFooterViewReuseIdentifier: "Header")
        tableView.register(UINib.init(nibName: "ActivityTableViewCell", bundle: nil), forCellReuseIdentifier: "ActivityCell")
    }
}
