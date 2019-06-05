//
//  SG50View.swift
//  50SoG
//
//  Created by Alexander v. Below on 05.06.19.
//  Copyright © 2019 AVB Software. All rights reserved.
//

import UIKit

class SG50View : UIView {
    override func draw(_ rect: CGRect) {
        drawShades(rect: rect, bounds: self.bounds)
    }
}
