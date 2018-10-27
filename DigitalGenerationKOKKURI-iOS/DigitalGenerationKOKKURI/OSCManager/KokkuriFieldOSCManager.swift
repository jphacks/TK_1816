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
    
    public static func sendPosition(_ point: CGPoint) {
        let mes: OSCMessage = OSCMessage(OSCAddressPattern("/pos"), Double(point.x), Double(point.y))
        OSCManager.shared.send(mes)
    }
}
