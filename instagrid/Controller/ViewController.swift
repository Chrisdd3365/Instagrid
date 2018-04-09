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
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    
    
    var pickerOne : UIImagePickerController?
    var pickerTwo : UIImagePickerController?
    var pickerThree: UIImagePickerController?
    var pickerFour: UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    @IBAction func chooseImage(_ sender: Any) {
        pickerOne = UIImagePickerController()
        pickerOne!.delegate = self
        pickerOne!.sourceType = UIImagePickerControllerSourceType.photoLibrary
        pickerOne!.allowsEditing = true
        self.present(pickerOne!, animated: true, completion: nil)
    }
    
    @IBAction func chooseImage1(_ sender: Any) {
        pickerTwo = UIImagePickerController()
        pickerTwo!.delegate = self
        pickerTwo!.sourceType = UIImagePickerControllerSourceType.photoLibrary
        pickerTwo!.allowsEditing = true
        self.present(pickerTwo!, animated: true, completion: nil)
    }
    
    @IBAction func chooseImage2(_ sender: Any) {
        pickerThree = UIImagePickerController()
        pickerThree!.delegate = self
        pickerThree!.sourceType = UIImagePickerControllerSourceType.photoLibrary
        pickerThree!.allowsEditing = true
        self.present(pickerThree!, animated: true, completion: nil)
    }
    
    @IBAction func chooseImage3(_ sender: Any) {
        pickerFour = UIImagePickerController()
        pickerFour!.delegate = self
        pickerFour!.sourceType = UIImagePickerControllerSourceType.photoLibrary
        pickerFour!.allowsEditing = true
        self.present(pickerFour!, animated: true, completion: nil)
    }
    
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if picker == pickerOne {
            let image = info[UIImagePickerControllerOriginalImage] as? UIImage
            imageView1.image = image
        }
        if picker == pickerTwo {
            let image = info[UIImagePickerControllerOriginalImage] as? UIImage
            imageView2.image = image
        }
        if picker == pickerThree {
            let image = info[UIImagePickerControllerOriginalImage] as? UIImage
            imageView3.image = image
        }
        if picker == pickerFour {
            let image = info[UIImagePickerControllerOriginalImage] as? UIImage
            imageView4.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
}

