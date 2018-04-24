//
//  RenderImage.swift
//  instagrid
//
//  Created by Christophe DURAND on 24/04/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import UIKit

extension UIImage {
    convenience init(view: UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in:UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: image!.cgImage!)
    }
}
