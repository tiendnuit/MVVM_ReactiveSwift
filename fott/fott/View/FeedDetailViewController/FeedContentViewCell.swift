//
//  FeedContentViewCell.swift
//  fott
//
//  Created by Scor Doan on 3/23/17.
//  Copyright © 2017 Scor Doan. All rights reserved.
//

import Foundation
import UIKit


class FeedContentViewCell: UITableViewCell {
    @IBOutlet weak var lbSubject: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    
    static let identifier = "FeedContentViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lbSubject.font = UIFont(name: FontNames.HelveticaNeue.Bold, size: 16)
        lbDescription.font = UIFont(name: FontNames.HelveticaNeue.Regular, size: 15)
        lbDescription.sizeToFit()
    }
}
