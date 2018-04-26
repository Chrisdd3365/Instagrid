//
//  GridView.swift
//  instagrid
//
//  Created by Christophe DURAND on 13/04/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import UIKit

class GridView: UIView {

    //MARK: - Outlets
    @IBOutlet weak var topRightView: UIView!
    @IBOutlet weak var bottomRightView: UIView!
    @IBOutlet weak var topLeftImageView: UIImageView!
    @IBOutlet weak var topRightImageView: UIImageView!
    @IBOutlet weak var bottomLeftImageView: UIImageView!
    @IBOutlet weak var bottomRightImageView: UIImageView!
    
    //MARK: - Class Methods
    //Method managing the setup of the layout 3
    func defaultView() {
        if topRightView.isHidden == true || bottomRightView.isHidden == true {
            topRightView.isHidden = false
            bottomRightView.isHidden = false
        } else {
            topRightView.isHidden = false
            bottomRightView.isHidden = false
        }
    }
    
    //Method managing the setup of the layout 2
    func hiddenBottomRightView() {
        if bottomRightView.isHidden == false {
            bottomRightView.isHidden = true
            topRightView.isHidden = false
        } else {
            bottomRightView.isHidden = true
        }
    }
    
    //Method managing the setup of the layout 1
    func hiddenTopRightView() {
        if topRightView.isHidden == false {
            topRightView.isHidden = true
            bottomRightView.isHidden = false
        } else {
            topRightView.isHidden = true
        }
    }
    
    //Method managing the reset of the grid view
    func resetGrid() {
       [topLeftImageView, topRightImageView, bottomLeftImageView, bottomRightImageView].forEach { $0?.image = nil }
    }
}

