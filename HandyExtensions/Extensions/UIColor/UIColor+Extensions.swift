
import Foundation
import UIKit

extension UIColor {
    private static let full = CGFloat(255)

    convenience init(white: Int) {
        let W = CGFloat((white >> 0) & 0xFF);

        let white = W / UIColor.full

        self.init(white: white, alpha: 1)
    }

    convenience init(rgb: Int) {
        let R = CGFloat((rgb >> 16) & 0xFF);
        let G = CGFloat((rgb >> 8) & 0xFF);
        let B = CGFloat((rgb >> 0) & 0xFF);

        self.init(red: R / UIColor.full, green: G / UIColor.full, blue: B / UIColor.full, alpha: 1)
    }

    convenience init(rgba: Int) {
        let R = CGFloat((rgba >> 24) & 0xFF)
        let G = CGFloat((rgba >> 16) & 0xFF)
        let B = CGFloat((rgba >> 8)  & 0xFF)
        let A = CGFloat((rgba >> 0)  & 0xFF)

        self.init(
                red: R / 255.0,
                green: G / 255.0,
                blue: B / 255.0,
                alpha: A / 255.0
        )
    }

    convenience init?(hex: String) {
        guard let rgb = Int(hex) else {
            return nil
        }

        self.init(rgb: rgb)
    }
}