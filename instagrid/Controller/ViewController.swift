//
//  ViewController.swift
//  instagrid
//
//  Created by Christophe DURAND on 02/04/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var hiddenTopRightView: UIView!
    @IBOutlet weak var hiddenBottomRightView: UIView!
    @IBOutlet weak var TopLeftImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

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
    
    @IBAction func addPhotoTopLeft(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            TopLeftImageView.image = image
        }
        else {
            print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        }
        self.dismiss(animated: true, completion: nil)
    }
}

