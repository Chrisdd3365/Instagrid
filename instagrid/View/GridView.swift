//
//  GridView.swift
//  instagrid
//
//  Created by Christophe DURAND on 13/04/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import UIKit

class GridView: UIView {

    @IBOutlet weak var topRightView: UIView!
    @IBOutlet weak var bottomRightView: UIView!
 
    @IBOutlet weak var topLeftImageView: UIImageView!
    @IBOutlet weak var topRightImageView: UIImageView!
    @IBOutlet weak var bottomLeftImageView: UIImageView!
    @IBOutlet weak var bottomRightImageView: UIImageView!
    
    func defaultView() {
        if topRightView.isHidden == true || bottomRightView.isHidden == true {
            topRightView.isHidden = false
            bottomRightView.isHidden = false
        } else {
            topRightView.isHidden = false
            bottomRightView.isHidden = false
        }
    }
    
    func hiddenBottomRightView() {
        if bottomRightView.isHidden == false {
            bottomRightView.isHidden = true
            topRightView.isHidden = false
        } else {
            bottomRightView.isHidden = true
        }
    }
    
    func hiddenTopRightView() {
        if topRightView.isHidden == false {
            topRightView.isHidden = true
            bottomRightView.isHidden = false
        } else {
            topRightView.isHidden = true
        }
    }
    
    func resetGrid() {
        topLeftImageView.image = nil
        topRightImageView.image = nil
        bottomLeftImageView.image = nil
        bottomRightImageView.image = nil
    }
}

