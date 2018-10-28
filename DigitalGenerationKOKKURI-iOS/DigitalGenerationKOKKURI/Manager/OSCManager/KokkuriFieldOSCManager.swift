//
//  KokkuriFieldOSCManager.swift
//  DigitalGenerationKOKKURI
//
//  Created by 村脇光洋 on 2018/10/27.
//  Copyright © 2018年 村脇光洋. All rights reserved.
//

import Foundation

import SwiftOSC

extension KokkuriFieldOSCManager {
    public static let shared = KokkuriFieldOSCManager()
}

final class KokkuriFieldOSCManager: NSObject {

    private var beforePoint: CGPoint = CGPoint.zero
    
    public func sendPosition(_ point: CGPoint) {
        let mes: OSCMessage = OSCMessage(OSCAddressPattern("/pos"),
                                     Double(beforePoint.x - point.x),
                                     Double(beforePoint.y - point.y))
        OSCManager.shared.send(mes)
        
        beforePoint = point
    }
    
    private override init() {
        super.init()
    }
}
