//
//  NSDate+TimeAgo.swift
//  TimeAgo
//
//  Created by Zhanna Yuskevych on 7/5/14.
//  Copyright (c) 2014 Zhanna Yuskevych. All rights reserved.
import Foundation
import CoreFoundation


class Formatter {
    class func sharedClient() -> NSDateFormatter {
        struct Static {
            static var instance: NSDateFormatter?
            static var token: dispatch_once_t = 0
        }
        dispatch_once(&Static.token, {
            Static.instance = NSDateFormatter()
            })
        return Static.instance!
    }
}

extension NSDate {
    
    func timeAgo() -> NSString
    {
        var deltaSeconds = fabs(self.timeIntervalSinceDate(NSDate.date()));
        var deltaMinutes = deltaSeconds / 60.0
        
        if deltaSeconds < 5 {
            return "Just now"
        } else if deltaSeconds < 60 {
            return NSString(format:"\(deltaSeconds) seconds")
        } else if deltaSeconds < 120 {
            return "A minute ago"
        } else if deltaMinutes < 60 {
            return NSString(format:"\(deltaSeconds) minutes ago");
        } else if deltaMinutes < 120 {
            return "An hour ago";
        } else if deltaMinutes < (24 * 60) {
            var minutes = floor(deltaMinutes/60)
            return NSString(format:"\(minutes) hours ago")
        } else if deltaMinutes < (24 * 60 * 2) {
            return "Yesterday"
        } else if deltaMinutes < (24 * 60 * 7) {
            var minutes = floor(deltaMinutes/(60 * 24))
            return NSString(format:"\(minutes) days ago")
        } else if deltaMinutes < (24 * 60 * 14) {
            return "Last week"
        } else if deltaMinutes < (24 * 60 * 31) {
            var minutes = floor(deltaMinutes/(60 * 24 * 7))
            return NSString(format:"\(minutes) weeks ago")
        } else if deltaMinutes < (24 * 60 * 61) {
            return "Last month";
        } else if deltaMinutes < (24 * 60 * 365.25) {
            var minutes = floor(deltaMinutes/(60 * 24 * 30))
            return NSString(format:"\(minutes) month ago")
        } else if (deltaMinutes < (24 * 60 * 731))
        {
            return "Last year"
        }
        
        var minutes = floor(deltaMinutes/(60 * 24 * 365));
        return NSString(format:"\(minutes) month ago")
    }
    
    func string(format:NSString, date:NSDate) -> String
    {
        Formatter.sharedClient().dateFormat = format
        return Formatter.sharedClient().stringFromDate(date)
    }
    
    class func date(format:String, date:String) -> NSDate
    {
        Formatter.sharedClient().dateFormat = format
        return Formatter.sharedClient().dateFromString(date)
    }
    
}