//
//  UIImagePickerControllerLandscapeMode.swift
//  instagrid
//
//  Created by Christophe DURAND on 16/04/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import UIKit

extension UIImagePickerController {
    open override var shouldAutorotate: Bool { return true }
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask { return .all }
}


