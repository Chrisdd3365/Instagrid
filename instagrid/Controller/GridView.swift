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
    
    var pressed = false
    
    @IBAction func pressedButton(_ sender: Any) {
        if !pressed {
            let image = UIImage(named: "Selected.png") as UIImage!
            defaultViewButton.setImage(image, for: .normal)
            pressed = true
        }
    }
    
    @IBAction func defaultView(_ sender: Any) {
        if hiddenTopRightView.isHidden == true || hiddenBottomRightView.isHidden == true {
            hiddenTopRightView.isHidden = false
            hiddenBottomRightView.isHidden = false
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
        }
        else {
            hiddenBottomRightView.isHidden = true
        }
    }
    
    @IBAction func hiddenTopRightView(_ sender: Any) {
        if hiddenTopRightView.isHidden == false {
            hiddenTopRightView.isHidden = true
            hiddenBottomRightView.isHidden = false
        }
        else {
            hiddenTopRightView.isHidden = true
        }
    }
}
