//
// Copyright 2025 Ermis Inc.
//

import UIKit

/// A `NavigationRouter` instance responsible for presenting alerts.
open class AlertsRouter: NavigationRouter<UIViewController> {
    open func showAlert(title: String?,
                        message: String?,
                        preferredStyle: UIAlertController.Style = .alert,
                        actions: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        actions.forEach { alert.addAction($0) }
        rootViewController.present(alert, animated: true)
    }
}
