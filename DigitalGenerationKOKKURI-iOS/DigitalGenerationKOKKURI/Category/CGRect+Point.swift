//
//  CGRect+Point.swift
//  expeet
//
//  Created by 村脇光洋 on 2018/06/17.
//  Copyright © 2018年 柄澤匠. All rights reserved.
//

import Foundation
import UIKit

extension CGRect {
    public var endPoint:CGPoint {
        set(value) {
            origin.x = value.x - size.width
            origin.y = value.y - size.height
        }
        
        get {
            return CGPoint(x: origin.x + width, y: origin.y + height)
        }
    }
}
