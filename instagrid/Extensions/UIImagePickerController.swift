//
//  ImagePickerExtension.swift
//  instagrid
//
//  Created by Christophe DURAND on 23/04/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import UIKit

//Extension managing the UIImagePickerController in landscape mode
extension UIImagePickerController {
    open override var shouldAutorotate: Bool { return true }
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask { return .all }
}
