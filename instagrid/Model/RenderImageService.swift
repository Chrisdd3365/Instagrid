//
//  RenderImageService.swift
//  instagrid
//
//  Created by Christophe DURAND on 24/04/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import UIKit

//Class managing the conversion of the grid view into image
class RenderImageService {
    static func convertGridViewToImage(gridView: GridView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(gridView.bounds.size, gridView.isOpaque, 0.0)
        gridView.drawHierarchy(in: gridView.bounds, afterScreenUpdates: true)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return image
    }
}
