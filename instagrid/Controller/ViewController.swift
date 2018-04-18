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
    
    @IBOutlet weak var swipeToShareLabel: UILabel!
    
    @IBOutlet weak var swipeDirectionImageView: UIImageView!
    
    @IBAction func defaultView(_ sender: Any) {
        if gridView.topRightView.isHidden == true || gridView.bottomRightView.isHidden == true {
            
            gridView.topRightView.isHidden = false
            gridView.bottomRightView.isHidden = false
            
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
            
            if hiddenBottomRightViewButton.currentImage == nil {
                hiddenBottomRightViewButton.setImage(#imageLiteral(resourceName: "Selected"), for: UIControlState.normal)
                hiddenTopRightViewButton.setImage(nil, for: UIControlState.normal)
                defaultViewButton.setImage(nil, for: UIControlState.normal)
            }
        } else {
            gridView.bottomRightView.isHidden = true
            }
    }
    
    @IBAction func hiddenTopRightView(_ sender: Any) {
        if gridView.topRightView.isHidden == false {
            
            gridView.topRightView.isHidden = true
            gridView.bottomRightView.isHidden = false
            
            if hiddenTopRightViewButton.currentImage == nil {
                hiddenTopRightViewButton.setImage(#imageLiteral(resourceName: "Selected"), for: UIControlState.normal)
                hiddenBottomRightViewButton.setImage(nil, for: UIControlState.normal)
                defaultViewButton.setImage(nil, for: UIControlState.normal)
            }
        } else {
            gridView.topRightView.isHidden = true
        }
    }
    
    var imagePicker = UIImagePickerController()
    var tag = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        if gridView.topRightView.isHidden == true && gridView.topLeftImageView.image != nil && gridView.bottomLeftImageView.image != nil && gridView.bottomRightImageView.image != nil || gridView.bottomRightView.isHidden == true && gridView.bottomLeftImageView.image != nil && gridView.topLeftImageView.image != nil && gridView.topRightImageView.image != nil {
            self.animationGridViewPortraitMode()
            self.animationGridViewLandscapeMode()
            self.showUIActivityViewController()
        }
        if gridView.topRightImageView.image == nil || gridView.topLeftImageView.image == nil || gridView.bottomLeftImageView.image == nil || gridView.bottomRightImageView.image == nil  {
            createAlert(title: "Select images", message: "Your grid must be full of images")
        } else {
            self.animationGridViewPortraitMode()
            self.animationGridViewLandscapeMode()
            self.showUIActivityViewController()
        }
    }
    
    private func showUIActivityViewController() {
        let image = UIImage()
        let activity = UIActivityViewController(activityItems: [image as Any], applicationActivities: nil)
        present(activity, animated: true, completion: nil)
        activity.completionWithItemsHandler = { (activityType, completed: Bool, returnedItems:[Any]?, error: Error?) in
            if completed == true {
                self.showGridViewPortraitMode()
                self.showGridViewLandscapeMode()
            } else {
                self.showGridViewPortraitMode()
                self.showGridViewLandscapeMode()
            }
        }
    }
    
    private func animationGridViewPortraitMode() {
        if UIDeviceOrientationIsPortrait(UIDevice.current.orientation) {
            let screenHeight = UIScreen.main.bounds.height
            var goingUpAnimation: CGAffineTransform
            goingUpAnimation = CGAffineTransform(translationX: 0, y: -screenHeight)
            
            UIView.animate(withDuration: 0.4, animations: { self.gridView.transform = goingUpAnimation}, completion: nil)
            UIView.animate(withDuration: 0.4, animations: { self.swipeToShareStackView.transform = goingUpAnimation }, completion: nil)
        }
    }
    
    private func animationGridViewLandscapeMode() {
        if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {
            let screenWidth = UIScreen.main.bounds.width
            var goingLeftAnimation: CGAffineTransform
            goingLeftAnimation = CGAffineTransform(translationX: -screenWidth, y: 0)
            
            UIView.animate(withDuration: 0.4, animations: { self.gridView.transform = goingLeftAnimation}, completion: nil)
            UIView.animate(withDuration: 0.4, animations: { self.swipeToShareStackView.transform = goingLeftAnimation }, completion: nil)
        }
    }
    
    private func showGridViewPortraitMode() {
        if UIDeviceOrientationIsPortrait(UIDevice.current.orientation) {
            let screenHeight = UIScreen.main.bounds.height
        
            gridView.transform = .identity
            gridView.transform = CGAffineTransform(translationX: 0, y: -screenHeight)
            UIView.animate(withDuration: 0.4, animations: { self.gridView.transform = .identity}, completion: nil)
        
            swipeToShareStackView.transform = .identity
            swipeToShareStackView.transform = CGAffineTransform(translationX: 0, y: -screenHeight)
            UIView.animate(withDuration: 0.4, animations: { self.swipeToShareStackView.transform = .identity }, completion: nil)
        }
    }
    
    private func showGridViewLandscapeMode() {
        if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {
            let screenWidth = UIScreen.main.bounds.width
        
            gridView.transform = .identity
            gridView.transform = CGAffineTransform(translationX: -screenWidth, y: 0)
            UIView.animate(withDuration: 0.4, animations: { self.gridView.transform = .identity}, completion: nil)
        
            swipeToShareStackView.transform = .identity
            swipeToShareStackView.transform = CGAffineTransform(translationX: -screenWidth, y: 0)
            UIView.animate(withDuration: 0.4, animations: { self.swipeToShareStackView.transform = .identity}, completion: nil)
        }
    }
   
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil) }))
        self.present(alert, animated: true, completion: nil )
    }
    
    func changeSwipeLabelAndImage(){
        if UIDeviceOrientationIsPortrait(UIDevice.current.orientation) {
            swipeToShareLabel.text = "Swipe up to share"
            swipeDirectionImageView.image = #imageLiteral(resourceName: "Flèche haut")
        }
        
        if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {
                swipeToShareLabel.text = "Swipe left to share"
                swipeDirectionImageView.image = #imageLiteral(resourceName: "Flèche gauche")
        }
    }
}

