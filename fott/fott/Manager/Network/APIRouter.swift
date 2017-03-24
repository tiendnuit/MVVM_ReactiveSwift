//
//  APIRouter.swift
//  fott
//
//  Created by Scor Doan on 3/22/17.
//  Copyright © 2017 Scor Doan. All rights reserved.
//

import Foundation
import Alamofire


enum APIRouter: URLRequestConvertible {
    
    static let baseURLString = APPURL.BaseURL
    
    case getArticlesList()
    
    //setup method
    var method: HTTPMethod {
        switch self {
            
        case .getArticlesList:
            return .get
        }
        
    }
    
    //setup urlrequest
    func asURLRequest() throws -> URLRequest{
        let result: (path: String, parameters: [String: AnyObject]) = {
            switch self {
            case .getArticlesList():
                return (APPURL.GetArticlesList, [String: AnyObject]())
            }
        }()

        var mutableURLRequest = URLRequest(url: try result.path.asURL())
        mutableURLRequest.httpMethod = method.rawValue
        
        //setup header
        //....
        print("Request: \(mutableURLRequest)")
        return try URLEncoding.default.encode(mutableURLRequest, with: result.parameters)
    }
}
