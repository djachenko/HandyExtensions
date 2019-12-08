
import Foundation
import UIKit

extension UIView {
    func loadFromNib() {
        let ownClass = type(of: self)
        let nibName = String(describing: ownClass)

        let nib = UINib(nibName: nibName, bundle: Bundle(for: ownClass))

        guard let nibRoot = nib.instantiate(withOwner: self).first as? UIView else {
            return
        }

        bounds = nibRoot.bounds
        frame = nibRoot.frame
        isOpaque = nibRoot.isOpaque

        addSubview(nibRoot)

        nibRoot.autoresizingMask = [UIView.AutoresizingMask.flexibleHeight, UIView.AutoresizingMask.flexibleWidth]
        nibRoot.translatesAutoresizingMaskIntoConstraints = true
    }
}
