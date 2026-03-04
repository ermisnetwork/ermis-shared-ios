//
// Copyright 2025 Ermis Inc.
//

import Foundation

private class BundleIdentifyingClass {}

extension Bundle {
    public static var ermisSharedUI: Bundle {
        return Bundle.module
    }
}
