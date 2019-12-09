

struct Matrix {
    private var contents: [Double]
    private (set) var columns: Int

    private init(columns: Int, contents: [Double]) {
        self.columns = columns
        self.contents = contents
    }

    init(_ backing: [[Double]]) {
        self.init(
                columns: backing.first!.count,
                contents: backing.reduce([]) { (acc, element) in
                    return acc + element
                }
        )
    }

    static func ones(rows: Int, columns: Int) -> Matrix {
        return Matrix(columns: columns, contents: [Double](repeating: 1, count: rows * columns))
    }

    subscript(row: Int, column: Int) -> Double {
        get {
            return contents[row * columns + column]
        }

        set(value) {
            contents[row * columns + column] = value
        }
    }

    subscript(row: Int) -> Matrix {
        get {
            let content = contents[row * columns..<(row + 1) * columns]

            return Matrix([Array(content)])
        }

        set(value) {
            value.contents.enumerated().forEach {(index, element) in
                self[row, index] = element
            }
        }
    }

    static func *(lhs: Matrix, factor: Double) -> Matrix {
        let newContents = lhs.contents.map { element in
            return element * factor
        }

        return Matrix(columns: lhs.columns, contents: newContents)
    }

    static func *=(lhs: inout Matrix, factor: Double) {
        lhs = lhs * factor
    }

    func minor(row: Int, column: Int) -> Matrix {
        let newContentsIndexed = contents.enumerated().filter { (index, element) in
            if index / columns == row {
                return false
            }

            if index % columns == column {
                return false
            }

            return true
        }

        let newContents = newContentsIndexed.map {(_, element) in
            return element
        }

        return Matrix(columns: columns - 1, contents: newContents)
    }

    func scalar() -> Double {
        return contents.first!
    }

    func det() -> Double {
        if columns == 1 {
            return scalar()
        }

        let minors = (0..<columns).map { columnIndex in
            minor(row: 0, column: columnIndex)
        }

        let dets = minors.map { matrix in
            return matrix.det()
        }

        let ownDet = dets.enumerated().reduce(0.0) {(acc, t) in
            let (index, minorDet) = t

            var sign:Double = 1

            if index % 2 == 1 {
                sign = -1
            }

            let element = self[0, index]

            return acc + minorDet * sign * element
        }

        return ownDet
    }
}

