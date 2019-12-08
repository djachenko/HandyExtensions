import Foundation
import UIKit

extension UIView {
    func asImage() -> UIImage? {
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: bounds)

            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        }
        else {
            UIGraphicsBeginImageContextWithOptions(frame.size, false, UIScreen.main.scale)

            guard let currentContext = UIGraphicsGetCurrentContext() else {
                return nil
            }

            layer.render(in: currentContext)

            let image = UIGraphicsGetImageFromCurrentImageContext()

            UIGraphicsEndImageContext()

            return image
        }
    }
}
