//
//  ConvertGridViewIntoImage.swift
//  instagrid
//
//  Created by Christophe DURAND on 23/04/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import UIKit

extension UIImage {
    convenience init(_ view: GridView) {
        UIGraphicsBeginImageContext(view.bounds.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let screenShot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: (screenShot?.cgImage)!)
    }
}
