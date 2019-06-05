import UIKit

func drawShades(rect: CGRect, bounds: CGRect) {
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

class SG50View : UIView {
    override func draw(_ rect: CGRect) {
        drawShades(rect: rect, bounds: self.bounds)
    }
}

let view = SG50View(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
