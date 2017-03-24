//
//  APIHelper.swift
//  fott
//
//  Created by Scor Doan on 3/22/17.
//  Copyright © 2017 Scor Doan. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

typealias CompletedBlock = ((_ finished: Bool, _ error:Error?) -> Void)
struct APIHelper {
    /*!
     * @discussion This function using to get articles list.
     * @param completionHandler Result block.
     * @return Void.
     */
    static func getArticlesList(_ completionHandler: @escaping (_ response: HTTPURLResponse?, _ data: AnyObject?, _ error: Error?) -> Void){
        request(APIRouter.getArticlesList()).responseJSON { (response)  -> Void in
            
            if let _json = response.result.value as? [String: AnyObject], let contents = _json["content"] as? [[String: AnyObject]]{
                let arrArticles = Mapper<Article>().mapArray(JSONArray:contents)
                for article in arrArticles!{
                    Article.store(object: article)
                }
                completionHandler(response.response, arrArticles as AnyObject?, nil)
            } else {
                completionHandler(response.response, nil, response.result.error)
            }
        }
    }
}
