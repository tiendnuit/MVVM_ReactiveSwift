//
//  KeyConstants.swift
//  fott
//
//  Created by Scor Doan on 3/22/17.
//  Copyright © 2017 Scor Doan. All rights reserved.
//

import Foundation

struct Key {
    static let DeviceType = "iOS"
    struct Beacon {
        static let ONEXUUID = "xxxx-xxxx-xxxx-xxxx"
    }
    
    struct UserDefaults {
        static let kAppRunningFirstTime = "userRunningAppFirstTime"
        static let kUserLoggedIn = "userLoggedIn"
    }
    
    struct Headers {
        static let Authorization = "Authorization"
        static let ContentTyp = "Content-Type"
    }
    
    struct ErrorMessage {
        static let listNotFound = "ERROR_LIST_NOT_FOUND"
        static let validationError = "ERROR_VALIDATION"
    }
}
