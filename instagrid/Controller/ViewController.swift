//
//  ViewController.swift
//  instagrid
//
//  Created by Christophe DURAND on 02/04/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var topLeftImageView: UIImageView!
    @IBOutlet weak var topRightImageView: UIImageView!
    @IBOutlet weak var bottomLeftImageView: UIImageView!
    @IBOutlet weak var bottomRightImageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    var imagePicked = 0
    
    @IBAction func chooseImage(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.savedPhotosAlbum){
            imagePicked = sender.tag
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        if imagePicked == 1 {
            topLeftImageView.image = pickedImage
        }
        if imagePicked == 2 {
            topRightImageView.image = pickedImage
        }
        if imagePicked == 3 {
            bottomLeftImageView.image = pickedImage
        }
        if imagePicked == 4 {
            bottomRightImageView.image = pickedImage
        }
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

