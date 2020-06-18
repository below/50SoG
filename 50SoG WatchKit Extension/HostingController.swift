//
//  HostingController.swift
//  50SoG WatchKit Extension
//
//  Created by Alexander v. Below on 18.06.20.
//  Copyright © 2020 Alexander von Below. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<SG50View> {
    override var body: SG50View {
        return SG50View()
    }
}
