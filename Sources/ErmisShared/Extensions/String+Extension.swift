//
// Copyright 2025 Ermis Inc.
//

import Foundation

public extension String? {
    var isEmptyOrNil: Bool {
        switch self {
        case .some(let value):
            return value.isEmpty
        case .none:
            return true
        }
    }
}
