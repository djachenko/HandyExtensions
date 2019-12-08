
import Foundation
import CoreGraphics

class RoundingHelper {
    static func round(value: CGFloat, places: Int) -> CGFloat {
        let factor = pow(CGFloat(10), CGFloat(places))

        return Darwin.round(value * factor) / factor
    }

    static func round(value: Double, places: Int) -> Double {
        let factor = pow(Double(10), Double(places))

        return Darwin.round(value * factor) / factor
    }
}
