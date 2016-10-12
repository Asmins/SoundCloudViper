//
//  HomeViewController.swift
//  SoundCloudViper
//
//  Created by admin on 11.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import SDWebImage

class HomeViewController: UIViewController {
    
    @IBOutlet var tableVIew: UITableView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    var navigation: HomeWireframe?
    var interactor: HomeInteractor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        self.title = "FEED"
        self.navigationController?.navigationBar.barTintColor = UIColor(colorLiteralRed: 255/255, green: 116/255, blue: 0/255, alpha: 1)
        self.setupTableView(tableView: tableVIew)
        self.interactor?.getData(tableView: tableVIew,activityIndecator:activityIndicator)
        // Do any additional setup after loading the view.
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell") as! ActivityTableViewCell
        self.interactor?.setupCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.interactor?.service.arrayActivity.count)!
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") as! HeaderTableViewCell
        self.interactor?.setupHeader(header: header)
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(60)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200)
    }
}

extension HomeViewController {
    func setupTableView(tableView:UITableView) {
        tableView.register(UINib.init(nibName: "HeaderTableView", bundle: nil), forHeaderFooterViewReuseIdentifier: "Header")
        tableView.register(UINib.init(nibName: "ActivityTableViewCell", bundle: nil), forCellReuseIdentifier: "ActivityCell")
    }
}
