//
//  History.swift
//  UnixTime_Mac
//
//  Created by Kato Masaya on 2015/01/17.
//  Copyright (c) 2015年 Kato Masaya. All rights reserved.
//

import Foundation

class History : NSObject {
    
    var unix: String!
    var date: String!
    
    init(unix: String, date: String){
        self.unix = unix
        self.date = date
    }
}
