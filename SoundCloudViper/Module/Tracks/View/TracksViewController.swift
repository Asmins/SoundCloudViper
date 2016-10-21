//
//  TracksViewController.swift
//  SoundCloudViper
//
//  Created by admin on 11.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TracksViewController: UIViewController {

    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var tableView: UITableView!

    var presenter: TracksPresenter?
    var navigation: TracksWireframe?
    var id = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView(tableView: tableView)
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.presenter?.getTrackInfo(id: "\(id)")
        self.presenter?.track?.drive(tableView.rx.items) {(tableView,_,track) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "TrackCell") as! TrackTableViewCell
            cell.configurationCell(track: track)
            return cell
        }
    }
}

extension TracksViewController {
    func setupTableView(tableView:UITableView) {
        tableView.register(UINib.init(nibName: "TrackTableViewCell", bundle: nil), forCellReuseIdentifier: "TrackCell")
    }
}

