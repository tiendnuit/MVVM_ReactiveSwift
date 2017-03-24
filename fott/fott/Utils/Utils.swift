//
//  Utils.swift
//  fott
//
//  Created by Scor Doan on 3/23/17.
//  Copyright © 2017 Scor Doan. All rights reserved.
//

import Foundation

/*
    Convert date to FOTT format
 */
func dateFromString(dateStr: String, format: String) -> Date? {
    let formatter = DateFormatter()
    formatter.dateFormat = format
    formatter.timeZone = TimeZone(abbreviation: "UTC")
    return formatter.date(from: dateStr)
}

func dateStringFOTTFormat(dateString:String) -> String{
    guard let date = dateFromString(dateStr: dateString, format: "dd.MM.yyyy HH:mm") else {
        return ""
    }
    
    let formatter = DateFormatter()
    formatter.timeZone = TimeZone(abbreviation: "UTC")
    
    if Calendar.current.isDateInToday(date){
        formatter.dateFormat = Date.is24HoursFormat ? "hh:mm" :"hh:mm a"
        let time = formatter.string(from: date)
        return "Today, \(time)"
    }else{
        formatter.dateFormat = Date.is24HoursFormat ? "dd MMMM, hh:mm" : "dd MMMM, hh:mm a"
        return formatter.string(from: date)
    }
}
