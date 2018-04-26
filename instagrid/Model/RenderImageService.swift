//
//  RenderImageService.swift
//  instagrid
//
//  Created by Christophe DURAND on 24/04/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import UIKit

//Extension managing the convert of the grid view into an image
extension UIView {
    @objc func convertImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        let name = Notification.Name(rawValue: "RenderImage")
        let notification = Notification(name: name)
        NotificationCenter.default.post(notification)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
