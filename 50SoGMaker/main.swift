//
//  main.swift
//  50SoGMaker
//
//  Created by Alexander v. Below on 06.05.19.
//  Copyright © 2019 AVB Software. All rights reserved.
//

import AppKit
import Darwin

guard let sizeParameter = Int(CommandLine.arguments[1]) else {
    exit (EXIT_FAILURE)
}

let size = NSSize(width: sizeParameter, height: sizeParameter)
let image = NSImage(size: size)

guard let rep = NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: Int(size.width), pixelsHigh: Int(size.height), bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true, isPlanar: false, colorSpaceName: .calibratedRGB, bytesPerRow: 0, bitsPerPixel: 0) else {
    exit(EXIT_FAILURE)
}
image.addRepresentation(rep)

image.lockFocus()

let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
drawShades(rect, rect)

image.unlockFocus()

guard let data = rep.representation(using: .png, properties: [:]) else {
    exit(EXIT_FAILURE)
}

do {
    let url = URL.init(fileURLWithPath: "/tmp/test.png")
    try data.write(to: url)
}
catch {
    exit (EXIT_FAILURE)
}
