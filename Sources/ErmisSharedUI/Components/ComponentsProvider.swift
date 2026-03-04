//
// Copyright 2025 Ermis Inc.
//

import UIKit

// MARK: - Protocols

/// A provider of `Components` — the central registry of UI component types.
public protocol SharedComponentsProvider: AnyObject {
    /// The components instance used to resolve UI component types.
    var sharedComponents: SharedComponents { get }
}

// MARK: - Default implementation

public extension SharedComponentsProvider {
    var sharedComponents: SharedComponents {
        return SharedComponents.default
    }
}

///// A provider of `Formatters` — date/name formatters.
//public protocol FormattersProvider: AnyObject {}
//
///// Combined provider protocol for UI components, theming and formatting.
public protocol SharedUIProvider: SharedComponentsProvider, ThemeProvider {}
