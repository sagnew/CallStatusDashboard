//
//  PhoneCall.swift
//  CallStatusDashboard
//
//  Created by Sam Agnew on 9/13/16.
//  Copyright © 2016 Sam Agnew. All rights reserved.
//

struct PhoneCall {
    let callSid: String
    let toNumber: String
    let fromNumber: String
    var callStatus: String
    
    init(callSid: String, toNumber: String, fromNumber: String, callStatus: String) {
        self.callSid = callSid
        self.toNumber = toNumber
        self.fromNumber = fromNumber
        self.callStatus = callStatus
    }
}
