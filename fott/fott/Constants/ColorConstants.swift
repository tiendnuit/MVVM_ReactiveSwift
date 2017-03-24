//
//  ColorConstants.swift
//  fott
//
//  Created by Scor Doan on 3/22/17.
//  Copyright © 2017 Scor Doan. All rights reserved.
//

import Foundation
import UIKit

struct AppColor {
    private struct Alphas{
        static let Opaque = CGFloat(1)
        static let SemiOpaque = CGFloat(0.8)
        static let Transparent = CGFloat(0.3)
    }
    
    static let appPrimaryColor = UIColor.white.withAlphaComponent(Alphas.Opaque)
    static let appSecondaryColor = UIColor.blue
    
    struct NavigationBar {
        static let TintColor = UIColor.white
        static let TextColor = UIColor.white
        static let BackgroundColor = UIColor.hexColor(0x2d333b)
    }
    
    struct TableView {
        static let SeparatorColor = UIColor.gray
    }
    
    struct TextColors {
        static let Error = UIColor.red
        static let Success = AppColor.appPrimaryColor
    }
}

