//
//  ViewController.swift
//  UnixTime_Mac
//
//  Created by Kato Masaya on 2015/01/17.
//  Copyright (c) 2015年 Kato Masaya. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var datePicker: NSDatePicker!
    @IBOutlet weak var unixTextField: NSTextField!
    @IBOutlet weak var resultTextField: NSTextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func pushClipboardBtn(sender: AnyObject) {
        
    }


}

