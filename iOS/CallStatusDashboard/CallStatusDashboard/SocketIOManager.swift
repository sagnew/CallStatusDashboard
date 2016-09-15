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
    var socket = SocketIOClient(socketURL: URL(string: "https://sagnew.ngrok.io")!, config: [.log(false), .forcePolling(true)])
    
    override init() {
        super.init()
        
        socket.on("test") { dataArray, ack in
            print(dataArray)
        }
        
        socket.on("status update") { dataArray, ack in
            NotificationCenter.default
                .post(name: Notification.Name(rawValue: "callStatusUpdateNotification"), object: dataArray[0] as? [String: AnyObject])
        
        }
    }
    
    func establishConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
}
