//
//  NSObject+Ext.swift
//  Model
//
//  Created by Kato Masaya on 2015/01/14.
//  Copyright (c) 2015年 Kato Masaya. All rights reserved.
//

import Foundation


//====================================================================================================
// MARK: NSString Extension Methods -

/*====================================================================================================
*/

extension NSString {
    
    /**
    *   引数dateを引数formatに合わせた文字列を返却する
    *   @param  date    :   対象の日時
    *   @param  format  :   フォーマット
    *   @return フォーマットに合わせた文字列
    */
    class func stringFromDate(date :NSDate, formatString: String) -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = formatString
        return formatter.stringFromDate(date)
    }
}

//====================================================================================================
// MARK: NSDate Extension Methods -

/*====================================================================================================
*/

extension NSDate {
    
    /**
    *   引数dateString文字列にあわせたNSDateを返却する
    *   @param  dateString    :   日付文字列
    *   @param  formatString    :   dateStringに合わせたフォーマット文字列
    *   @return 文字列から生成されるNSDate
    */
    class func dateFromString(dateString: String, formatString: String) -> NSDate {
        var formatter = NSDateFormatter()
        formatter.timeStyle = NSDateFormatterStyle.FullStyle
        formatter.dateFormat = formatString
        return formatter.dateFromString(dateString)!
    }
}

