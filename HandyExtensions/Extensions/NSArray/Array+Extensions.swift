import Foundation

extension Array {
    init(count: Int, generator:(Int) -> Element) {
        self.init()

        (0..<count).forEach({index in
            let element = generator(index)

            append(element)
        })
    }

    func all(_ predicate: (Element) -> Bool) -> Bool {
        for item in self {
            if !predicate(item) {
                return false
            }
        }

        return true
    }

    func any(_ predicate: (Element) -> Bool) -> Bool {
        return !all(predicate)
    }

    func count(_ predicate: (Element) -> Bool) -> Int {
        var count = 0

        forEach { e in
            if predicate(e) {
                count += 1
            }
        }

        return count
    }

    mutating func remove(at indices: [Int]) {
        indices.reversed().forEach { index in
            remove(at: index)
        }
    }

    mutating func trim(to size: Index) {
        let exceedingSize = count - size

        if exceedingSize > 0 {
            removeLast(exceedingSize)
        }
    }

    func take(chunkSize: Int, includeTail: Bool = true) -> Array<Array<Element>> {

        var chunkCount: Int = count / chunkSize

        if count % chunkSize != 0 {
            chunkCount += 1
        }

        var chunks = [[Element]](count: chunkCount) { _ in
            return [Element]()
        }

        enumerated().forEach { (index, element) in
            let chunkNumber = index / chunkSize

            chunks[chunkNumber].append(element)
        }

        return chunks
    }

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


extension Array where Element: Equatable {
    func indices(of x: Element) -> [Int] {
        var indices = [Int]()

        enumerated().forEach { (index, element) in
            if element == x {
                indices.append(index)
            }
        }

        return indices
    }
}

extension Array where Element: Comparable {
    func indexOfMin() -> Int? {
        guard let minValue = self.min() else {
            return nil
        }

        let valueIndex = firstIndex(of: minValue)

        return valueIndex
    }
}