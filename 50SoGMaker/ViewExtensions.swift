//
//  ViewExtensions.swift
//  50SoGMaker
//
//  Created by Alexander v. Below on 26.11.21.
//  Copyright © 2021 AVB Software. All rights reserved.
//

import AppKit
import SwiftUI

extension View {

    func renderAsImage(size: CGSize? = nil) -> NSImage? {
        let view = NSHostingView(rootView: self)
        var imageSize = size ?? view.fittingSize
        let scale = view.layer?.contentsScale ?? 1.0
        imageSize = CGSize(width: imageSize.width / scale, height: imageSize.height / scale)
        view.setFrameSize(imageSize)
        return view.bitmapImage()
    }

}

public extension NSView {

    func bitmapImage() -> NSImage? {
        guard let rep = bitmapImageRepForCachingDisplay(in: bounds) else {
            return nil
        }
        cacheDisplay(in: bounds, to: rep)
        guard let cgImage = rep.cgImage else {
            return nil
        }
        return NSImage(cgImage: cgImage, size: bounds.size)
    }
}
