//
//  FeedDetailViewController.swift
//  fott
//
//  Created by Scor Doan on 3/23/17.
//  Copyright © 2017 Scor Doan. All rights reserved.
//

import Foundation
import UIKit

class FeedDetailViewController: BaseViewController {
    @IBOutlet weak var tableview: UITableView!
    var feedViewModel:FeedViewModel?{
        didSet{
            fillUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup dynamic cell for tableview
        tableview.rowHeight = UITableViewAutomaticDimension
        tableview.estimatedRowHeight = 260
        
        fillUI()
    }
    
    func fillUI(){
        if !isViewLoaded {
            return
        }
        
        guard let viewModel = feedViewModel else {
            return
        }
        
        lbTitle?.text = viewModel.feedTitle
        tableview.reloadData()
    }
    
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension FeedDetailViewController:UITabBarDelegate, UITableViewDataSource{
    public func numberOfSections(in tableView: UITableView) -> Int{
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : (feedViewModel?.contentsCount ?? 0)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FeedViewCell.identifier) as? FeedViewCell
            guard let feedCell = cell else {
                return UITableViewCell()
            }
            feedCell.cellModel = feedViewModel
            return feedCell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: FeedContentViewCell.identifier) as? FeedContentViewCell
            guard let feedCell = cell else {
                return UITableViewCell()
            }
            let feedContent = feedViewModel!.feedContent(at: indexPath.row)
            feedCell.lbSubject.text = feedContent.subject
            feedCell.lbDescription.text = feedContent.descr
            
            return feedCell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
