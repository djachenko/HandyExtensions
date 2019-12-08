
import Foundation
import UIKit

extension UIColor {
    private static let full = CGFloat(255)

    convenience init(rgb: Int) {
        let R = CGFloat((rgb >> 16) & 0xFF);
        let G = CGFloat((rgb >> 8) & 0xFF);
        let B = CGFloat((rgb >> 0) & 0xFF);

        self.init(red: R / UIColor.full, green: G / UIColor.full, blue: B / UIColor.full, alpha: 1)
    }

    convenience init(white: Int) {
        let W = CGFloat((white >> 0) & 0xFF);

        let white = W / UIColor.full

        self.init(white: white, alpha: 1)
    }
}