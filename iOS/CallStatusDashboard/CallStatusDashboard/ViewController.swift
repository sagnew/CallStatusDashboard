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
    var phoneCalls: [PhoneCall] = []

    @IBOutlet var callStatusTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callStatusTableView.delegate = self
        self.callStatusTableView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.handleCallStatusUpdateNotification(_:)), name: NSNotification.Name(rawValue: "callStatusUpdateNotification"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.phoneCalls.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: phoneCallCellIdentifier, for: indexPath)
        
        let row = (indexPath as NSIndexPath).row
        let call = phoneCalls[row]
        
        cell.detailTextLabel?.text = "\(call.fromNumber) -> \(call.toNumber): \(call.callStatus)"
        cell.textLabel?.text = call.callSid
        
        return cell
    }
    
    func handleCallStatusUpdateNotification(_ notification: Notification) {
        if let data = notification.object as? [String: String],
                let callSid = data["callSid"], let toNumber = data["to"],
                let fromNumber = data["fromNumber"], let callStatus = data["callStatus"] {
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

