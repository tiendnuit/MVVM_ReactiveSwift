//
//  MenuViewController.swift
//  fott
//
//  Created by Scor Doan on 3/22/17.
//  Copyright © 2017 Scor Doan. All rights reserved.
//

import Foundation
import UIKit

enum MenuItem: String {
    case feed = "FOTT Feed"
    case trip = "Trips"
    case people = "People"
}
let menuItemReuseIdentifierCell = "menuItemCell"

class MenuViewController: UIViewController {
    let menuItems = [MenuItem.feed.rawValue, MenuItem.trip.rawValue, MenuItem.people.rawValue]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension MenuViewController:UITabBarDelegate, UITableViewDataSource{
    
    // MARK: - UITableViewDelegate, UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemIdentifierCell = menuItems[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: itemIdentifierCell)
        cell?.selectionStyle = .none
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
