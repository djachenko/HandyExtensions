//
// Created by Igor Djachenko on 2019-12-10.
// Copyright (c) 2019 Igor Djachenko. All rights reserved.
//

import Foundation

class ExecutionMeasurer {
    static func measure(name: String, code: ()->Void) {
        let methodStart = Date()

        code()

        let methodFinish = Date()

        let executionTime = methodFinish.timeIntervalSince(methodStart)

        print("Measured \(name): \(executionTime)")
    }
}
