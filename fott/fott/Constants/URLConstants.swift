//
//  URLConstants.swift
//  fott
//
//  Created by Scor Doan on 3/22/17.
//  Copyright © 2017 Scor Doan. All rights reserved.
//

import Foundation

struct APPURL {
    private struct Domains {
        static let Dev = "https://www.apphusetreach.no"
        static let Staging = ""
        static let Product = ""
    }
    
    private struct Routes {
        static let Api = "/application/40495"
    }
    
    private static let Domain = Domains.Dev
    private static let Route = Routes.Api
    static let BaseURL = Domain + Route
    
    static var GetArticlesList: String {
        return BaseURL + "/article/get_articles_list"
    }
}
