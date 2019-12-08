
import Foundation

extension Date {

    func withoutTime() -> Date? {
        let calendar = Calendar.current

        let components = calendar.dateComponents([.year, .month, .day], from: self)

        let dateWithoutTime = calendar.date(from: components)

        return dateWithoutTime
    }

    func compareWithoutTime(_ other: Date) -> ComparisonResult? {
        guard let selfWithoutTime = withoutTime(),
              let otherWithoutTime = other.withoutTime() else {
            return nil
        }

        return selfWithoutTime.compare(otherWithoutTime)
    }
}