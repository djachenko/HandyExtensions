
import Foundation
import UIKit

class A5DoubleSqueezeButton: UIView {
    func popImage() {
        UIView.animateKeyframes(withDuration: 0.3, delay: 0, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 2.0 / 3) {
                self.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
            }

            UIView.addKeyframe(withRelativeStartTime: 2.0 / 3, relativeDuration: 1.0 / 3) {
                self.transform = .identity
            }
        })
    }
}
