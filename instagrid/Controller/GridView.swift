//
//  GridView.swift
//  instagrid
//
//  Created by Christophe DURAND on 13/04/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import UIKit

class GridView: UIView {

    @IBOutlet private var hiddenTopRightView: UIView!
    @IBOutlet private var hiddenBottomRightView: UIView!
    @IBOutlet private var defaultViewButton: UIButton!
    @IBOutlet private var hiddenTopRightViewButton: UIButton!
    @IBOutlet private var hiddenBottomRightViewButton: UIButton!
    @IBOutlet private var defaultViewButtonSelectedImageView: UIImageView!
    @IBOutlet private var hiddenBottomRightViewButtonSelectedImageView: UIImageView!
    @IBOutlet private var hiddenTopRightViewSelectedImageView: UIImageView!
    
    
    @IBAction func defaultView(_ sender: Any) {
        if hiddenTopRightView.isHidden == true || hiddenBottomRightView.isHidden == true {
            hiddenTopRightView.isHidden = false
            hiddenBottomRightView.isHidden = false
            defaultViewButtonSelectedImageView.isHidden = false
            hiddenBottomRightViewButtonSelectedImageView.isHidden = true
            hiddenTopRightViewSelectedImageView.isHidden = true
        }
        else {
            hiddenTopRightView.isHidden = false
            hiddenBottomRightView.isHidden = false
        }
    }
    
    @IBAction func hiddenBottomRightView(_ sender: Any) {
        if hiddenBottomRightView.isHidden == false {
            hiddenBottomRightView.isHidden = true
            hiddenTopRightView.isHidden = false
            defaultViewButtonSelectedImageView.isHidden = true
            hiddenBottomRightViewButtonSelectedImageView.isHidden = false
            hiddenTopRightViewSelectedImageView.isHidden = true
        }
        else {
            hiddenBottomRightView.isHidden = true
        }
    }
    
    @IBAction func hiddenTopRightView(_ sender: Any) {
        if hiddenTopRightView.isHidden == false {
            hiddenTopRightView.isHidden = true
            hiddenBottomRightView.isHidden = false
            defaultViewButtonSelectedImageView.isHidden = true
            hiddenBottomRightViewButtonSelectedImageView.isHidden = true
            hiddenTopRightViewSelectedImageView.isHidden = false
        }
        else {
            hiddenTopRightView.isHidden = true
        }
    }
}
