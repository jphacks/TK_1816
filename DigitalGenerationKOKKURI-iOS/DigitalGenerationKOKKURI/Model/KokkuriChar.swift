//
//  KokkuriChar.swift
//  DigitalGenerationKOKKURI
//
//  Created by 村脇光洋 on 2018/10/27.
//  Copyright © 2018年 村脇光洋. All rights reserved.
//

import UIKit

final class KokkuriChar: NSObject {
    
    public let char: String
    public let rect: CGRect

    init(_ dic: NSDictionary, char: String) {
        self.char = char
        self.rect = CGRect(
            x: dic["x"] as! Int,
            y: dic["y"] as! Int,
            width: dic["width"] as! Int,
            height: dic["height"] as! Int
        )
  
        super.init()
    }
}
