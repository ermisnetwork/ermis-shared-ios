//
// Copyright 2025 Ermis Inc.
//

import ErmisShared
import UIKit

/// An object containing types of UI Components that are used through the UI SDK.
public struct SharedComponents {

    /// A view that displays the avatar image.
    public var avatarView: AvatarView.Type = AvatarView.self

    /// The default avatar thumbnail size.
    public var avatarThumbnailSize: CGSize = .init(width: 40, height: 40)

    /// Object with set of function for handling images from CDN
    public var imageCDN: ImageCDN = ErmisImageCDN()

    /// Object which is responsible for loading images
    public var imageLoader: ImageLoading = NukeImageLoader()

    /// Object responsible for providing resizing operations for `UIImage`
    public var imageProcessor: ImageProcessor = NukeImageProcessor()
    // MARK: - Navigation

    /// The alerts router used to present alerts.
    public var alertsRouter: AlertsRouter.Type = AlertsRouter.self

    public init() {}

    public static var `default` = SharedComponents()
}
