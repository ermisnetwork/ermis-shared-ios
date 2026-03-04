//
// Copyright 2025 Ermis Inc.
//

import Foundation

public enum ErmisRuntimeCheck: Sendable {
    /// Enables assertions thrown by the Ermis SDK.
    ///
    /// When set to false, a message will be logged on console, but the assertion will not be thrown.
    nonisolated(unsafe) public static var assertionsEnabled = false

    /// For *internal use* only
    ///
    ///  Enables background mapping of DB models
    nonisolated(unsafe) public static var isBackgroundMappingEnabled = false

    /// For *internal use* only
    ///
    ///  Established the maximum depth of relationships to fetch when performing a mapping
    ///
    ///  Eg.
    ///  Relationship:    Message --->  QuotedMessage --->    QuotedMessage   ---X---     NIL
    ///  Relationship:    Channel  --->      Message         --->     QuotedMessage  ---X---     NIL
    ///  Depth:                     0                         1                                     2                               3
    nonisolated(unsafe) public static var backgroundMappingRelationshipsMaxDepth = 2

    /// For *internal use* only
    ///
    ///  Returns true if the maximum depth of relationships to fetch when performing a mapping is not yet met
    public static func canFetchRelationship(currentDepth: Int) -> Bool {
        guard isBackgroundMappingEnabled else { return true }

        return currentDepth <= backgroundMappingRelationshipsMaxDepth
    }

    /// For *internal use* only
    ///
    ///  Enables using our legacy web socket connection.
    nonisolated(unsafe) public static var _useLegacyWebSocketConnection = false
}
