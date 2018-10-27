//
//  BaseOSCManager.swift
//  DigitalGenerationKOKKURI
//
//  Created by 村脇光洋 on 2018/10/27.
//  Copyright © 2018年 村脇光洋. All rights reserved.
//

import SwiftOSC

extension OSCManager: OSCServerDelegate {
    public static let shared = OSCManager()
}

class OSCManager: NSObject {
    
    private let client: OSCClient
    private let server: OSCServer
    
    private override init() {
        client = OSCClient(address: "192.168.179.6", port: 50000)
        server = OSCServer(address: "", port: 50000)
        
        super.init()
        
        server.start()
        server.delegate = self
    }
    
    public func send(_ message: OSCMessage) {
        self.client.send(message)
    }
    
    func didReceive(_ message: OSCMessage){
        if let integer = message.arguments[0] {
            print("Received \(integer)")
        } else {
            print(message)
        }
    }
}
