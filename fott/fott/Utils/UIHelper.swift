//
//  UIHelper.swift
//  fott
//
//  Created by Scor Doan on 3/23/17.
//  Copyright © 2017 Scor Doan. All rights reserved.
//

import Foundation
import UIKit


func showSimpleAlert(_ title: String, message: String?, presentingController: UIViewController) {
    
    let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    controller.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) -> Void in
        
    }))
    
    presentingController.present(controller, animated: true, completion: nil)
}


