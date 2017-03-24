//
//  FeedViewModelController.swift
//  fott
//
//  Created by Scor Doan on 3/22/17.
//  Copyright © 2017 Scor Doan. All rights reserved.
//

import Foundation
import RealmSwift

/*
    FeedViewModelController
 */
class FeedViewModelController{
    fileprivate var arrFeedViewModel = [FeedViewModel]()
    var feedCount: Int {
        return arrFeedViewModel.count
    }
    
    func viewModel(at index:Int) -> FeedViewModel{
        return arrFeedViewModel[index]
    }
    
    func getArticlesList(_ completed:CompletedBlock?){
        APIHelper.getArticlesList {[unowned self] (response, data, error) in
            if let arrArticles = data as? [Article] {
                self.arrFeedViewModel = arrArticles.map(){FeedViewModel(with:$0)}
            }else{
                //get data offline
                let realm = try! Realm()
                let arrArticles = realm.objects(Article.self)
                self.arrFeedViewModel = arrArticles.map(){FeedViewModel(with:$0)}
            }
            completed?(true, nil)
        }
    }
}
