//
//  ViewController.swift
//  CallStatusDashboard
//
//  Created by Sam Agnew on 9/13/16.
//  Copyright © 2016 Sam Agnew. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let phoneCallCellIdentifier = "PhoneCallCell"
    var phoneCalls: [PhoneCall] = [PhoneCall(callSid: "Hello", toNumber: "", fromNumber: "", callStatus: "")]

    @IBOutlet var callStatusTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callStatusTableView.delegate = self
        self.callStatusTableView.dataSource = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.handleCallStatusUpdateNotification(_:)), name: "callStatusUpdateNotification", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.phoneCalls.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(phoneCallCellIdentifier, forIndexPath: indexPath)
        
        let row = indexPath.row
        let call = phoneCalls[row]
        
        cell.detailTextLabel?.text = "\(call.fromNumber) -> \(call.toNumber): \(call.callStatus)"
        cell.textLabel?.text = call.callSid
        
        return cell
    }
    
    func handleCallStatusUpdateNotification(notification: NSNotification) {
        if let data = notification.object as? [String: String],
                callSid = data["callSid"], toNumber = data["to"],
                fromNumber = data["fromNumber"], callStatus = data["callStatus"] {
            let newPhoneCall = PhoneCall(callSid: callSid, toNumber: toNumber, fromNumber: fromNumber, callStatus: callStatus)
            var isNewCall = true
            
            self.phoneCalls = self.phoneCalls.map({ phoneCall -> PhoneCall in
                if phoneCall.callSid == newPhoneCall.callSid {
                    // This is the updated phone call.
                    isNewCall = false
                    return newPhoneCall
                }
                
                // This is an unchanged phone call.
                return phoneCall
            })
            
            if isNewCall {
                self.phoneCalls.append(newPhoneCall)
            }
        
            self.callStatusTableView.reloadData()
        }
    }

}

