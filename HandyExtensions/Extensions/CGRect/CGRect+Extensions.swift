
import Foundation
import CoreGraphics

extension CGRect {
    var center: CGPoint {
        return CGPoint(
                x: origin.x + size.width / 2,
                y: origin.y + size.height / 2
        )
    }

    func scaled(by scale: CGFloat, anchor: CGPoint = .zero) -> CGRect {
        let newOrigin = CGPoint(
                x: (origin.x - anchor.x) * scale + anchor.x,
                y: (origin.y - anchor.y) * scale + anchor.y
        )

        let newSize = CGSize(
                width: size.width * scale,
                height: size.height * scale
        )

        return CGRect(origin: newOrigin, size: newSize)
    }
}