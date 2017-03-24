//
//  FeedViewModel.swift
//  fott
//
//  Created by Scor Doan on 3/22/17.
//  Copyright © 2017 Scor Doan. All rights reserved.
//

import Foundation

/*
    FeedViewModel
 */
class FeedViewModel:NSObject{
    var feed:Article
    var feedImageUrl:URL?
    var feedTitle:String?
    var feedDate:String?
    var feedIngress:String?
    var contentsCount:Int = 0
    
    init(with feed:Article){
        self.feed = feed
        if let imageStr = feed.image {
            self.feedImageUrl = URL(string: imageStr)
        }
        self.feedTitle = feed.title
        self.feedIngress = feed.ingress
        
        //format date to FOTT format
        if let dateStr = feed.dateTime {
            self.feedDate = dateStringFOTTFormat(dateString: dateStr)
        }
        
        contentsCount = feed.contents.count
    }
    
    func feedContent(at index:Int) -> ArticleContent {
        return feed.contents[index]
    }
}
