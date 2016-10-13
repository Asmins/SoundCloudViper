//
//  TracksViewController.swift
//  SoundCloudViper
//
//  Created by admin on 11.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class TracksViewController: UIViewController {

    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var tableView: UITableView!
    
    var interactor:TracksInteractor?
    var navigation:TracksWireframe?
    var id = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView(tableView: tableView)
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.interactor?.getTrackInfo(id: id,tableView: tableView)
    }
}

extension TracksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackCell") as! TrackTableViewCell
        self.interactor?.setupCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.interactor?.service.arrayTracks.count)!
    }
}

extension TracksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
}

extension TracksViewController {
    func setupTableView(tableView:UITableView) {
        tableView.register(UINib.init(nibName: "TrackTableViewCell", bundle: nil), forCellReuseIdentifier: "TrackCell")
    }
}

