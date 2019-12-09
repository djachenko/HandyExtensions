
import Foundation
import UIKit

extension UIView {
    private func innerInit() {
        let ownClass = type(of: self)
        let nibName = String(describing: ownClass)

        guard let nibRoot = UIView.fromXib(name: nibName)

        bounds = nibRoot.bounds
        frame = nibRoot.frame
        isOpaque = nibRoot.isOpaque

        addSubview(nibRoot)

        nibRoot.autoresizingMask = [UIView.AutoresizingMask.flexibleHeight, UIView.AutoresizingMask.flexibleWidth]
        nibRoot.translatesAutoresizingMaskIntoConstraints = true
    }

    static func fromXib() -> Self? {
        return fromXib(name: String(describing: self)) as? Self
    }

    static func fromXib(name: String) -> UIView? {
        let loaded = Bundle.main.loadNibNamed(name, owner: nil)!

        let viewArray = loaded.filter({item in
            return item is UIView
        }) as! [UIView]

        return viewArray.first
    }
}
