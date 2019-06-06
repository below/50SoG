//
//  main.swift
//  50SoGMaker
//
//  Created by Alexander v. Below on 06.05.19.
//  Copyright © 2019 AVB Software. All rights reserved.
//

import AppKit
import Darwin

guard CommandLine.arguments.count > 1, let sizeParameter = Int(CommandLine.arguments[1]) else {
    exit (EXIT_FAILURE)
}

let size = NSSize(width: sizeParameter, height: sizeParameter)

guard let rep = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: Int(size.width), pixelsHigh: Int(size.height), bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false, colorSpaceName: .calibratedRGB, bytesPerRow: 0, bitsPerPixel: 0) else {
    exit(EXIT_FAILURE)
}

let gtx = NSGraphicsContext.init(bitmapImageRep: rep)
NSGraphicsContext.saveGraphicsState()
NSGraphicsContext.current = gtx

let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
drawShades(rect: rect, bounds: rect)

NSGraphicsContext.restoreGraphicsState()

guard let data = rep.representation(using: .png, properties: [:]) else {
    exit(EXIT_FAILURE)
}

do {
    let url = URL.init(fileURLWithPath: "\(sizeParameter).png")
    try data.write(to: url)
}
catch {
    exit (EXIT_FAILURE)
}
