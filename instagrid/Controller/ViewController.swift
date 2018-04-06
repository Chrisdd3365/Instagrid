//
//  ViewController.swift
//  instagrid
//
//  Created by Christophe DURAND on 02/04/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hiddenTopRightView: UIView!
    @IBOutlet weak var hiddenBottomRightView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var hideTopRightViewButton: UIButton!
    @IBOutlet weak var hideBottomRightViewButton: UIButton!
    @IBOutlet weak var defaultViewButton: UIButton!
    
    
    @IBAction func hideTopRightView(_ sender: Any) {
        if hiddenTopRightView.isHidden == false {
            hiddenTopRightView.isHidden = true
            hiddenBottomRightView.isHidden = false
        }
        else {
            hiddenTopRightView.isHidden = true
        }
    }
    
    @IBAction func hideBottomRightView(_ sender: Any) {
        if hiddenBottomRightView.isHidden == false {
            hiddenBottomRightView.isHidden = true
            hiddenTopRightView.isHidden = false
        }
        else {
            hiddenBottomRightView.isHidden = true
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
}

