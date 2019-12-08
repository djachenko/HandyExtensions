import Foundation

extension Array {
    func distinct(key: (Element) -> AnyHashable) -> [Element] {
        var cache: [AnyHashable: Element] = [AnyHashable: Element]()

        forEach { e in
            let k = key(e)

            if !cache.keys.contains(k) {
                cache[k] = e
            }
        }

        return cache.values.map { $0 }
    }
}


extension Array where Element: Hashable {
    func distinct() -> [Element] {
        return distinct { $0 }
    }
}