//
//  ViewController.swift
//  TimeAgo
//
//  Created by Zhanna Yuskevych on 7/5/14.
//  Copyright (c) 2014 Zhanna Yuskevych. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //var date : NSDate = NSDate.date().dateByAddingTimeInterval(60 * 60 * 24)
        let format = "yyyy-MM-dd HH:mm:ss";
        
        var date = NSDate.date(format, date: "2014-07-05 12:15:10");
        println(date.timeAgo());
        println("date ago \(date.string(format, date:date))")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

