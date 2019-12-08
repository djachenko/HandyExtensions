

import Foundation
import UIKit

@objc class LayoutDirectionHelper: NSObject {
    @objc static let instance = LayoutDirectionHelper()

    private override init() {}

    @objc func isRTL() -> Bool {
        return UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft
    }

    @objc func currentDirection() -> NSTextAlignment {
        if isRTL() {
            return .right
        }
        else {
            return .left
        }
    }
}
