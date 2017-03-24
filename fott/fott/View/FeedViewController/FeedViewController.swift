//
//  FeedViewController.swift
//  fott
//
//  Created by Scor Doan on 3/22/17.
//  Copyright © 2017 Scor Doan. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

class FeedViewController: BaseViewController {
    @IBOutlet weak var tbvFeed: UITableView!
    var refreshControl:UIRefreshControl?
    let feedViewModelController = FeedViewModelController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //setup dynamic cell for tableview
        tbvFeed.rowHeight = UITableViewAutomaticDimension
        tbvFeed.estimatedRowHeight = 290

        //Pull to refresh
        refreshControl = UIRefreshControl()
        refreshControl?.tintColor = UIColor.white
        let attributesStr = [ NSForegroundColorAttributeName: UIColor.white ]
        refreshControl!.attributedTitle = NSAttributedString(string: "Pull to refresh", attributes: attributesStr)
        refreshControl!.addTarget(self, action: #selector(FeedViewController.getArticles), for:
            UIControlEvents.valueChanged)
        tbvFeed.addSubview(refreshControl!)
        tbvFeed.alwaysBounceVertical = true
        
        //get articles list
        getArticles()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let feedDetailVC = segue.destination as? FeedDetailViewController
        //set viewmodel for FeedDetailViewController
        feedDetailVC?.feedViewModel = feedViewModelController.viewModel(at: tbvFeed.indexPathForSelectedRow!.row)
    }
    
    func getArticles(){
        MBProgressHUD.showAdded(to: self.view, animated: true)
        feedViewModelController.getArticlesList {[unowned self] (finished, error) in
            DispatchQueue.main.async {
                MBProgressHUD.hide(for: self.view, animated: true)
                self.refreshControl?.endRefreshing()
                if finished {
                    self.tbvFeed.reloadData()
                }else{
                    showSimpleAlert("Error", message: error?.localizedDescription, presentingController: self)
                }
            }
            
        }
    }

}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension FeedViewController:UITabBarDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedViewModelController.feedCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedViewCell.identifier) as? FeedViewCell
        guard let feedCell = cell else {
            return UITableViewCell()
        }
        feedCell.selectionStyle = .none
        feedCell.cellModel = feedViewModelController.viewModel(at: indexPath.row)
        return feedCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
