//
//  RealmStorable.swift
//  fott
//
//  Created by Scor Doan on 3/23/17.
//  Copyright © 2017 Scor Doan. All rights reserved.
//

import Foundation
import RealmSwift
/*
    Protocol api of Realm
*/
protocol RealmStorable {
    static func store(object:Object)
}

extension RealmStorable {
    static func store(object:Object){
        let realm = try! Realm()
        try! realm.write{
            realm.add(object, update:true)
        }
    }
}
