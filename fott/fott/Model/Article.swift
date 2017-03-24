//
//  Article.swift
//  fott
//
//  Created by Scor Doan on 3/22/17.
//  Copyright © 2017 Scor Doan. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import ObjectMapper_Realm

/*
    Article object
 */
class Article: Object, Mappable, RealmStorable {
    dynamic var id:Int = 0
    dynamic var title:String?
    dynamic var dateTime:String?
    dynamic var ingress:String?
    dynamic var image:String?

    var contents = List<ArticleContent>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        dateTime <- map["dateTime"]
        ingress <- map["ingress"]
        image <- map["image"]
        contents <- (map["content"], ListTransform<ArticleContent>())
        
    }
}
