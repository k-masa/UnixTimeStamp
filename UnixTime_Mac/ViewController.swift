//
//  ViewController.swift
//  UnixTime_Mac
//
//  Created by Kato Masaya on 2015/01/17.
//  Copyright (c) 2015年 Kato Masaya. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var histories: NSMutableArray = []
    
    @IBOutlet weak var datePicker: NSDatePicker!
    @IBOutlet weak var unixTextField: NSTextField!
    @IBOutlet weak var resultTextField: NSTextField!
    @IBOutlet var historyArrayController: NSArrayController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = NSDate()
        self.datePicker.dateValue = date
        self.resultTextField.stringValue = self.getUnitTime(self.datePicker.dateValue)
    }

    override var representedObject: AnyObject? {
        didSet {

        }
    }
    
    /*==================================================================================================
    MARK: IBAction Methods -
    ====================================================================================================
    */
    @IBAction func pushClipboardBtn(sender: AnyObject) {
        var pastBoard = NSPasteboard.generalPasteboard()
        var str: AnyObject? = pastBoard.stringForType(NSPasteboardTypeString)
        
        if let pastObj: AnyObject = str {
            let pastStr = pastObj as? String
            if let pStr = pastStr {
                let time = atof(pStr)
                if time == 0 {
                    return
                }
                self.unixTextField.stringValue = "\(pStr)"
                self.resultTextField.stringValue = self.getDateFromUnixTime(time)
                
                let history = History(unix: self.unixTextField.stringValue, date: self.resultTextField.stringValue)
                self.histories.addObject(history)
                self.historyArrayController.content = self.histories
            }
        }
    }
    @IBAction func valueChangeDatePicker(sender: NSDatePicker) {
        self.resultTextField.stringValue = self.getUnitTime(sender.dateValue)
        self.setPastBoard(self.resultTextField.stringValue)
    }
    
    @IBAction func valueChangedUnixTextField(sender: NSTextField) {
        let unix = atof(sender.stringValue)
        if unix == 0 {
            return
        }
        self.resultTextField.stringValue = self.getDateFromUnixTime(unix)
        self.setPastBoard(self.resultTextField.stringValue)
    }
    
    /*==================================================================================================
    MARK: Helper Methods -
    ====================================================================================================
    */
    func getDateFromUnixTime(time: NSTimeInterval) -> String {
        var date = NSDate(timeIntervalSince1970: time);
        return NSString.stringFromDate(date, formatString: "YYYY/MM/dd HH:mm:ss")
    }
    func getUnitTime(date: NSDate) -> String {
        var time = date.timeIntervalSince1970
        return NSString(format: "%0.0f", time)
    }
    func setPastBoard(string: String) -> Bool {
        var pastboard = NSPasteboard.generalPasteboard()
        pastboard.clearContents()
        let seccess = pastboard.setString(string, forType: NSPasteboardTypeString)
        return seccess
    }
}
