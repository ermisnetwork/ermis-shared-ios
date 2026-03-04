//
// Copyright 2025 Ermis Inc.
//

import UIKit

public protocol CallViewInjectorDelegate: AnyObject {}

/// An injector that displays a call view inside a message cell.
/// Subclass in ErmisChatUI to connect it to `MessageContentView`.
open class CallViewInjector: NSObject, CustomCellViewInjectorProtocol {

    public override required init() {
        super.init()
    }

    open var customView: UIView? {
        return nil
    }

    open var fillAllAvailableWidth: Bool {
        return false
    }

    open func contentViewDidPrepareForReuse() {}

    open func contentViewDidLayout(options: MessageLayoutOptions) {}

    open func contentViewDidcontentDidChanged() {}
}
