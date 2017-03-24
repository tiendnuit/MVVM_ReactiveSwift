//
//  BaseViewController.swift
//  fott
//
//  Created by Scor Doan on 3/22/17.
//  Copyright © 2017 Scor Doan. All rights reserved.
//

import Foundation
import UIKit

/*
    Abstract view controller using whole project.
 */

class BaseViewController: UIViewController {
    
    @IBOutlet weak var btnMenu:UIButton?
    @IBOutlet weak var vwHeader:UIView?
    @IBOutlet weak var lbTitle:UILabel?

    //MARK : - Private methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if self.revealViewController() != nil && btnMenu != nil{
            btnMenu!.addTarget(self, action: #selector(BaseViewController.btnMenuClicked(_:)), for: UIControlEvents.touchUpInside)
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.revealViewController().rearViewRevealWidth = ScreenSize.SCREEN_WIDTH - 60
        }
        
        //lbTitle?.font = Fonts.latoBoldWithSize(18)
        lbTitle?.textColor = AppColor.NavigationBar.TextColor
        
        vwHeader?.backgroundColor = AppColor.NavigationBar.BackgroundColor
    }
    
    //MARK: - Event methods
    func btnMenuClicked(_ sender: AnyObject) {
        self.revealViewController().revealToggle(sender)
    }
    
    @IBAction func btnBackClicked(_ sender: AnyObject) {
        _ = self.navigationController?.popViewController(animated: true)
    }

}
