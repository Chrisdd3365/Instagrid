//
//  ViewController.swift
//  instagrid
//
//  Created by Christophe DURAND on 02/04/2018.
//  Copyright © 2018 Christophe DURAND. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var defaultViewButton: UIButton!
    @IBOutlet weak var hiddenBottomRightViewButton: UIButton!
    @IBOutlet weak var hiddenTopRightViewButton: UIButton!
    
    @IBOutlet weak var gridView: GridView!
    @IBOutlet weak var swipeToShareStackView: UIStackView!
    
    
    @IBAction func defaultView(_ sender: Any) {
        if gridView.topRightView.isHidden == true || gridView.bottomRightView.isHidden == true {
            gridView.topRightView.isHidden = false
            gridView.bottomRightView.isHidden = false
            
            defaultViewButton.imageView?.isHidden = false
            hiddenTopRightViewButton.imageView?.isHidden = true
            hiddenBottomRightViewButton.imageView?.isHidden = true
            
            if defaultViewButton.currentImage == nil {
                defaultViewButton.setImage(#imageLiteral(resourceName: "Selected"), for: UIControlState.normal)
                hiddenBottomRightViewButton.setImage(nil, for: UIControlState.normal)
                hiddenTopRightViewButton.setImage(nil, for: UIControlState.normal)
            }
        } else {
            gridView.topRightView.isHidden = false
            gridView.bottomRightView.isHidden = false
        }
    }
    
    @IBAction func hiddenBottomRightView(_ sender: Any) {
        if gridView.bottomRightView.isHidden == false {
            gridView.bottomRightView.isHidden = true
            gridView.topRightView.isHidden = false
            
            defaultViewButton.imageView?.isHidden = true
            hiddenTopRightViewButton.imageView?.isHidden = true
            
            if hiddenBottomRightViewButton.currentImage == nil {
                hiddenBottomRightViewButton.setImage(#imageLiteral(resourceName: "Selected"), for: UIControlState.normal)
                hiddenTopRightViewButton.setImage(nil, for: UIControlState.normal)
                defaultViewButton.setImage(nil, for: UIControlState.normal)
                hiddenBottomRightViewButton.imageView?.isHidden = false
                } else {
                hiddenBottomRightViewButton.imageView?.isHidden = true
            }
        } else {
            gridView.bottomRightView.isHidden = true
            }
    }
    
    @IBAction func hiddenTopRightView(_ sender: Any) {
        if gridView.topRightView.isHidden == false {
            gridView.topRightView.isHidden = true
            gridView.bottomRightView.isHidden = false
            
            defaultViewButton.imageView?.isHidden = true
            hiddenBottomRightViewButton.imageView?.isHidden = true
            
            if hiddenTopRightViewButton.currentImage == nil {
                hiddenTopRightViewButton.setImage(#imageLiteral(resourceName: "Selected"), for: UIControlState.normal)
                hiddenBottomRightViewButton.setImage(nil, for: UIControlState.normal)
                defaultViewButton.setImage(nil, for: UIControlState.normal)
                hiddenTopRightViewButton.imageView?.isHidden = false
            } else {
                hiddenTopRightViewButton.imageView?.isHidden = true
            }
        } else {
            gridView.topRightView.isHidden = true
        }
    }
    
    var imagePicker = UIImagePickerController()
    var tag = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: Selector(("rotated")), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
    }
    
    @IBAction func chooseImage(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            tag = sender.tag
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        if tag == 1 {
            gridView.topLeftImageView.image = pickedImage
        }
        if tag == 2 {
            gridView.topRightImageView.image = pickedImage
        }
        if tag == 3 {
            gridView.bottomLeftImageView.image = pickedImage
        }
        if tag == 4 {
            gridView.bottomRightImageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func swipeToShare(_ sender: UIPanGestureRecognizer) {
        let image = UIImage()
        let activity = UIActivityViewController(activityItems: [image as Any], applicationActivities: nil)
        present(activity, animated: true, completion: nil)
        activity.completionWithItemsHandler = { (activityType, completed: Bool, returnedItems:[Any]?, error: Error?) in
            if completed == true {
                self.showGridViewPortraitMode()
            } else {
                self.showGridViewPortraitMode()
            }
        }
        
        let screenHeight = UIScreen.main.bounds.height
        var goingUpAnimation: CGAffineTransform
        goingUpAnimation = CGAffineTransform(translationX: 0, y: -screenHeight)
        
        UIView.animate(withDuration: 0.7, animations: { self.gridView.transform = goingUpAnimation}, completion: nil)
        UIView.animate(withDuration: 0.7, animations: { self.swipeToShareStackView.transform = goingUpAnimation }, completion: nil)
        
        let screenWidth = UIScreen.main.bounds.width
        var goingLeftAnimation: CGAffineTransform
        goingLeftAnimation = CGAffineTransform(translationX: -screenWidth, y: 0)
        
        UIView.animate(withDuration: 0.7, animations: { self.gridView.transform = goingLeftAnimation}, completion: nil)
        UIView.animate(withDuration: 0.7, animations: { self.swipeToShareStackView.transform = goingLeftAnimation }, completion: nil)
    }
    
    private func showGridViewPortraitMode() {
        let screenHeight = UIScreen.main.bounds.height
        
        gridView.transform = .identity
        gridView.transform = CGAffineTransform(translationX: 0, y: -screenHeight)
        UIView.animate(withDuration: 0.7, animations: { self.gridView.transform = .identity}, completion: nil)
        
        swipeToShareStackView.transform = .identity
        swipeToShareStackView.transform = CGAffineTransform(translationX: 0, y: -screenHeight)
        UIView.animate(withDuration: 0.7, animations: { self.swipeToShareStackView.transform = .identity }, completion: nil)
        
        
        let screenWidth = UIScreen.main.bounds.width
        
        gridView.transform = .identity
        gridView.transform = CGAffineTransform(translationX: -screenWidth, y: 0)
        UIView.animate(withDuration: 0.7, animations: { self.gridView.transform = .identity}, completion: nil)
        
        swipeToShareStackView.transform = .identity
        swipeToShareStackView.transform = CGAffineTransform(translationX: -screenWidth, y: 0)
        
        UIView.animate(withDuration: 0.7, animations: { self.swipeToShareStackView.transform = .identity}, completion: nil)
    }
    
    private func labelChangeSwipeLeft(){
        if UIDeviceOrientationIsLandscape(UIDevice.current.orientation)
        {
            print("landscape")
            label.hidden = true
        }
    }
    
    
    
}

