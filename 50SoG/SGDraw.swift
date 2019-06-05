//
//  SGDraw.swift
//  50SoG
//
//  Created by Alexander v. Below on 05.06.19.
//  Copyright © 2019 AVB Software. All rights reserved.
//

#if TARGET_OS_IPHONE
typealias OSColor = UIColor
#else
import UIKit
typealias OSColor = UIColor
#endif
@objc public class objcWrapper: NSObject {
    @objc static func objcDrawShades(rect: CGRect, bounds: CGRect) {
        drawShades(rect: rect, bounds: bounds)
    }
}

public func drawShades(rect: CGRect, bounds: CGRect) {
    var ctx : CGContext!
    ctx = UIGraphicsGetCurrentContext()
    ctx.saveGState()
    defer {
        ctx.restoreGState()
    }
    let fullWidth = bounds.size.width
    let oneShadeWidth = fullWidth / 50.0
    
    let firstShade = Int(floor (rect.origin.x * 50.0 / fullWidth))
    let lastShade = Int(floor (rect.maxX * 50.0 / fullWidth))
    for shade in firstShade...lastShade {
        
        let grey = 1.0 - CGFloat(shade) / 49.0
        let shadeOfGrey = UIColor(white: grey, alpha: 1.0)
        shadeOfGrey.setFill()
        let rect = CGRect(x: CGFloat(shade)*oneShadeWidth, y: rect.origin.y, width: oneShadeWidth + 2, height: rect.size.height)
        ctx.addRect(rect)
        ctx.fillPath()
    }
}
