//
//  KokkuriCharManager.swift
//  DigitalGenerationKOKKURI
//
//  Created by 村脇光洋 on 2018/10/27.
//  Copyright © 2018年 村脇光洋. All rights reserved.
//

import UIKit

extension KokkuriCharManager {
    public static let shared: KokkuriCharManager = KokkuriCharManager()
}

final class KokkuriCharManager: NSObject {
    
    public let allChars: [KokkuriChar]

    private override init() {
        let filePath = Bundle.main.path(forResource: "kokkuri_char", ofType: "plist")
        let plistDict: NSDictionary = NSDictionary(contentsOfFile: filePath!)!
        self.allChars = plistDict.allKeys.map({ (key) in
            return KokkuriChar(plistDict[key] as! NSDictionary, char: key as! String)
        })
        
        super.init()
    }
    
    public static func rectOfChar() -> CGPoint {
        // TODO

        return CGPoint.zero
    }
    
    public static func char(_ text: String) -> KokkuriChar? {
        for char in KokkuriCharManager.shared.allChars {
            if char.char == text {
                return char
            }
        }
        
        return nil
    }
    
    public static func charByPoint(_ point: CGPoint) -> KokkuriChar? {
        for char in KokkuriCharManager.shared.allChars {
            if char.rect.origin.x < point.x && point.x < char.rect.endPoint.x &&
                char.rect.origin.y < point.y && point.y < char.rect.endPoint.y {
                return char
            }
        }
        
        return nil
    }
}
