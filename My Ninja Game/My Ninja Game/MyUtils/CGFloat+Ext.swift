//
//  CGFloat+Ext.swift
//  My Ninja Game
//
//  Created by MacBook on 24.03.2022.
//

import CoreGraphics

extension CGFloat {
    
    static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(0xFFFFFFFF)) //return 0, 1
    }
    
    static func  randon(min: CGFloat, max: CGFloat) -> CGFloat {
        assert(min < max)
        return CGFloat.random() * (min - max) + min //return min or max
    }
}

