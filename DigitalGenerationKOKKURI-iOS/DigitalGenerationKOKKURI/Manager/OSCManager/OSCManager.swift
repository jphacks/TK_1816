//
//  BaseOSCManager.swift
//  DigitalGenerationKOKKURI
//
//  Created by 村脇光洋 on 2018/10/27.
//  Copyright © 2018年 村脇光洋. All rights reserved.
//

import SwiftOSC
import SwiftyUserDefaults

extension OSCManager: OSCServerDelegate {
    public static let shared = OSCManager()
}

class OSCManager: NSObject {
    
    private let client: OSCClient
    
    private override init() {
        client = OSCClient(address: Defaults[.oscIp] ?? "localhost", port: Defaults[.oscPort])
        
        super.init()
    }
    
    public func send(_ message: OSCMessage) {
        self.client.send(message)
    }
    
    public func setSendIp(_ ipStr: String) {
        client.address = ipStr
    }
    
    public func setSendPort(_ port: Int) {
        client.port = port
    }
}
