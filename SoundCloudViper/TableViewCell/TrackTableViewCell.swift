//
//  TrackTableViewCell.swift
//  SoundCloudViper
//
//  Created by admin on 12.10.16.
//  Copyright © 2016 Mozi. All rights reserved.
//

import UIKit

class TrackTableViewCell: UITableViewCell {
    
    @IBOutlet var imageViewForPhotoAlbum: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewForPhotoAlbum.clipsToBounds = true
        imageViewForPhotoAlbum.layer.masksToBounds = true
        imageViewForPhotoAlbum.layoutIfNeeded()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configurationCell(track:Track) {
        self.titleLabel.text = track.title
        self.subTitleLabel.text = track.subTitle
        self.durationLabel.text = track.time
        let url = URL(string: track.urlImage)
        self.imageViewForPhotoAlbum.sd_setImage(with: url)
    }
}
