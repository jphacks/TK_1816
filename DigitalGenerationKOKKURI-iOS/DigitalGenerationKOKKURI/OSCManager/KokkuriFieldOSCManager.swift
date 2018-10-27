//
//  KokkuriFieldOSCManager.swift
//  DigitalGenerationKOKKURI
//
//  Created by 村脇光洋 on 2018/10/27.
//  Copyright © 2018年 村脇光洋. All rights reserved.
//

import Foundation

import SwiftOSC

final class KokkuriFieldOSCManager: OSCManager {
    
    public static func sendPosition() {
//        let message = OSCMessage(
//            OSCAddressPattern("/pos"),
//            100,
//            5.0,
//            "Hello World",
//            Blob(),
//            true,
//            false,
//            nil,
//            impulse,
//            Timetag(1)
//        )
        
        let mes: OSCMessage = OSCMessage(OSCAddressPattern("/pos"), "hello world")
        OSCManager.shared.send(mes)
    }
}
