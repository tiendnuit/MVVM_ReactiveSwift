//
//  FeedViewCell.swift
//  fott
//
//  Created by Scor Doan on 3/22/17.
//  Copyright © 2017 Scor Doan. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage

class FeedViewCell: UITableViewCell {
    @IBOutlet weak var imvFeed: UIImageView!
    @IBOutlet weak var lbFeedTitle: UILabel!
    @IBOutlet weak var lbFeedDate: UILabel!
    @IBOutlet weak var lbFeedIngress: UILabel!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    
    var cellModel: FeedViewModel? {
        didSet {
            bindViewModel()
        }
    }
    
    static let identifier = "FeedViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lbFeedTitle.font = UIFont(name: FontNames.HelveticaNeue.Bold, size: 16)
        lbFeedDate.font = UIFont(name: FontNames.HelveticaNeue.Bold, size: 13)
        lbFeedIngress.font = UIFont(name: FontNames.HelveticaNeue.Regular, size: 15)
        lbFeedIngress.sizeToFit()
    }
    
    func bindViewModel() {
        if let url = cellModel?.feedImageUrl{
            imvFeed.sd_setImage(with: url)
            imageHeightConstraint.constant = 150
        }else{
            imageHeightConstraint.constant = 30
        }

        lbFeedTitle.text = cellModel?.feedTitle
        lbFeedDate.text = cellModel?.feedDate
        lbFeedIngress.text = cellModel?.feedIngress
    }
}
