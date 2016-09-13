//
//  SocketIOManager.swift
//  CallStatusDashboard
//
//  Created by Sam Agnew on 9/13/16.
//  Copyright © 2016 Sam Agnew. All rights reserved.
//

import UIKit
import SocketIO

class SocketIOManager: NSObject {
    static let sharedInstance = SocketIOManager()
    var socket = SocketIOClient(socketURL: NSURL(string: "https://sagnew.ngrok.io")!, config: [.Log(false), .ForcePolling(true)])
    
    override init() {
        super.init()
        socket.on("status update") { data, ack in
            print(data)
            print(ack)
        }
    }
    
    func establishConnection() {
        socket.connect()
    }
    
    
    func closeConnection() {
        socket.disconnect()
    }
}
