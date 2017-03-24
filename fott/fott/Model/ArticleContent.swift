//
//  ArticleContent.swift
//  fott
//
//  Created by Scor Doan on 3/23/17.
//  Copyright © 2017 Scor Doan. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

class ArticleContent: Object, Mappable, RealmStorable {
    dynamic var type:String?
    dynamic var subject:String?
    dynamic var descr:String?
    
    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        type <- map["type"]
        subject <- map["subject"]
        descr <- map["description"]
        
    }
}
