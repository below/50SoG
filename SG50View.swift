//
//  SG50View.swift
//  50SoG
//
//  Created by Alexander v. Below on 05.06.19.
//  Copyright © 2019 AVB Software. All rights reserved.
//

import UIKit

import SwiftUI

struct ShadeOfGrey: View {
    var grey = 0.0
    var body: some View {
        Rectangle().fill(Color(white: grey))
    }
}

struct SG50View: View {
    let maxGrey = 50 - 1
    var body: some View {
        HStack(spacing: 0) {
            ForEach((0...maxGrey).reversed(), id: \.self) {
                ShadeOfGrey(grey: Double($0) / Double(self.maxGrey))
            }
        }
    }
}

struct SG50View_Previews: PreviewProvider {
    static var previews: some View {
        SG50View()
    }
}
