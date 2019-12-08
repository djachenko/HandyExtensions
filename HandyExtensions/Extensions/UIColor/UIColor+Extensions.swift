
import Foundation
import UIKit

extension UIColor {
    convenience init(rgb: Int) {
        let R = CGFloat((rgb >> 16) & 0xFF);
        let G = CGFloat((rgb >> 8) & 0xFF);
        let B = CGFloat((rgb >> 0) & 0xFF);

        let full = CGFloat(255)

        self.init(red: R / full, green: G / full, blue: B / full, alpha: 1)
    }

    convenience init(white: Int) {
        let W = CGFloat((white >> 0) & 0xFF);

        let full = CGFloat(255)

        let white = W / full

        self.init(red: white, green: white, blue: white, alpha: 1)
    }
}