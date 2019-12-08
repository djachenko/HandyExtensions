
import CoreGraphics
import UIKit

struct DeviceType {
    static let iPhone5 = DeviceType(width: 320, height: 568)
    static let iPhone6 = DeviceType(width: 375, height: 667)
    static let iPhone6P = DeviceType(width: 414, height: 736)//won't work for 6/6S Plus - they have 375
    static let iPhoneX = DeviceType(width: 375, height: 812)
    static let iPhoneXMax = DeviceType(width: 414, height: 896)
    static let iPad = DeviceType(width: 768, height: 1024)
    static let iPadPro = DeviceType(width: 1024, height: 1366)
    static let unknown = DeviceType(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

    static let screens = [
        iPhone5,
        iPhone6,
        iPhone6P,
        iPhoneX,
        iPhoneXMax,
        iPad,
        iPadPro
    ]

    let width: CGFloat
    let height: CGFloat

    private static var cachedCurrent: DeviceType!

    static var current: DeviceType {
        if cachedCurrent == nil {
            cachedCurrent = determineType()
        }

        return cachedCurrent
    }

    private static func determineType() -> DeviceType {
        let screenHeight = max(UIScreen.main.bounds.height, UIScreen.main.bounds.width)

        guard let foundItem = screens.first(where: { $0.height.isEqual(to: screenHeight) }) else {
            assertionFailure("Unexpected screen")

            return unknown
        }

        return foundItem
    }
}
