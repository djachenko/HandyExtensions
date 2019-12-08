
import Foundation

extension String {

    public func rsplit(separator: Character, maxSplits: Int? = nil) -> [SubSequence] {
        let usualSplit = split(separator: separator)

        let splitCount = maxSplits ?? usualSplit.count - 1

        var splits = Array(usualSplit.dropFirst(usualSplit.count - splitCount))
        let joined = usualSplit.dropLast(splitCount)


//        let prefixString = joined.joined(separator: String(separator))
//
//        splits.insert(prefixString, at: 0)

        var joinedLength = joined.reduce(0) { acc, element in
            return acc + element.count
        }

        if joined.count > 1 {
            joinedLength += joined.count - 1
        }

        splits.insert(prefix(upTo: self.index(startIndex, offsetBy: joinedLength)), at: 0)

        return splits
    }
}
