//
//  Date+FOTT.swift
//  fott
//
//  Created by Scor Doan on 3/23/17.
//  Copyright © 2017 Scor Doan. All rights reserved.
//

import Foundation

extension Date {
    
    static var is24HoursFormat : Bool  {
        let dateString = Date.localFormatter.string(from: Date())
        
        if dateString.contains(Date.localFormatter.amSymbol) || dateString.contains(Date.localFormatter.pmSymbol) {
            return false
        }
        
        return true
    }
    
    private static let localFormatter : DateFormatter = {
        let formatter = DateFormatter()
        
        formatter.locale    = Locale.autoupdatingCurrent
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        
        return formatter
    }()
}
