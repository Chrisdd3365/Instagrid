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
    //Method managing the setup of the default grid view
    func defaultView() {
        if topRightView.isHidden == true || bottomRightView.isHidden == true {
            topRightView.isHidden = false
            bottomRightView.isHidden = false
        } else {
            topRightView.isHidden = false
            bottomRightView.isHidden = false
        }
    }
    
    //Method managing the setup of the bottom rectangular grid view
    func hiddenBottomRightView() {
        if bottomRightView.isHidden == false {
            bottomRightView.isHidden = true
            topRightView.isHidden = false
        } else {
            bottomRightView.isHidden = true
        }
    }
    
    //Method managing the setup of the top rectangular grid view
    func hiddenTopRightView() {
        if topRightView.isHidden == false {
            topRightView.isHidden = true
            bottomRightView.isHidden = false
        } else {
            topRightView.isHidden = true
        }
    }
    
    //Method managing to check if the setup of the top rectangular grid view or the bottom rectangular grid view is allowed to be shared
    func isAllowedToBeShared() -> Bool {
        var isAllowedToBeShared = false
        if checkTopRectangularGridView() || checkBottomRectangularGridView() {
            isAllowedToBeShared = true
        }
        return isAllowedToBeShared
    }
    
    //Method managing to check if images into the setup of the top rectangular grid view are missing
    private func checkTopRectangularGridView() -> Bool {
        var topRectangularGridViewChecked = false
        if topRightView.isHidden == true && topLeftImageView.image != nil && bottomLeftImageView.image != nil && bottomRightImageView.image != nil {
            topRectangularGridViewChecked = true
        }
        return topRectangularGridViewChecked
    }
    
    //Method managing to check if images into the setup of the bottom rectangular grid view are missing
    private func checkBottomRectangularGridView() -> Bool {
        var bottomRectangularGridViewChecked = false
        if bottomRightView.isHidden == true && bottomLeftImageView.image != nil && topLeftImageView.image != nil && topRightImageView.image != nil {
            bottomRectangularGridViewChecked = true
        }
        return bottomRectangularGridViewChecked
    }
    
    //Method managing the reset of the grid view
    func resetGrid() {
       [topLeftImageView, topRightImageView, bottomLeftImageView, bottomRightImageView].forEach { $0?.image = nil }
    }
}

