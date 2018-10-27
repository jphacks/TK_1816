//
//  BaseOSCManager.swift
//  DigitalGenerationKOKKURI
//
//  Created by 村脇光洋 on 2018/10/27.
//  Copyright © 2018年 村脇光洋. All rights reserved.
//

import SwiftOSC

extension BaseOSCManager {
    public static let shared = BaseOSCManager()
}

class BaseOSCManager: NSObject {
    
    private let client: OSCClient
    
    private override init() {
        client = OSCClient(address: "l92.168.179.6", port: 50000)
        
        super.init()
    }
    
    public func send(_ message: OSCMessage) {
        self.client.send(message)
    }
}
