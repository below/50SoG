//
//  main.swift
//  50SoGMaker
//
//  Created by Alexander v. Below on 06.05.19.
//  Copyright © 2019 AVB Software. All rights reserved.
//

import AppKit
import Darwin

guard CommandLine.arguments.count > 1, var width = Int(CommandLine.arguments[1]) else {
    let name: String
    if let url = URL(string: CommandLine.arguments[0]) {
        name = url.lastPathComponent
    } else {
        name = "SG50Maker"
    }
    fputs("usage: \(name) <width> [<height>]\n", stderr)
    exit (EXIT_FAILURE)
}

var height: Int = width
if CommandLine.arguments.count > 2, let heightParameter = Int(CommandLine.arguments[2]) {
    height = heightParameter
}
let size = NSSize(width: Double(width), height: Double(height))

guard let image = SG50View().renderAsImage(size: size) else {
    fputs("Creation of image failed\n", stderr)
    exit(EXIT_FAILURE)
}

guard let cgRef = image.cgImage(forProposedRect: nil, context: nil, hints: nil) else {
    fputs("cgRef failed\n", stderr)
    exit(EXIT_FAILURE)
}
let rep = NSBitmapImageRep.init(cgImage: cgRef)
rep.size = image.size // if you want the same resolution

guard let data = rep.representation(using: .png, properties: [:]) else {
    fputs("Unable to create data representation\n", stderr)
    exit(EXIT_FAILURE)
}

do {
    let url = URL.init(fileURLWithPath: "\(width).png\n")
    try data.write(to: url)
}
catch {
    fputs("Unable to write file: \(error)\n", stderr)
    exit (EXIT_FAILURE)
}
