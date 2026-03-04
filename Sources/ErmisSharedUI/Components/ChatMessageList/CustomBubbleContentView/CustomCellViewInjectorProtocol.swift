//
// Copyright 2025 Ermis Inc.
//

import UIKit

/// Protocol for objects that inject custom content views into a message cell.
public protocol CustomCellViewInjectorProtocol {
    /// A customView will be added to `bubbleContentContainer`
    var customView: UIView? { get }
    /// Called after `contentView.prepareForReuse` is called.
    func contentViewDidPrepareForReuse()
    /// Called after the `contentView` finished its `layout(options:)` methods.
    func contentViewDidLayout(options: MessageLayoutOptions)
    /// Called after `contentView.updateContent` is called.
    func contentViewDidcontentDidChanged()
}
