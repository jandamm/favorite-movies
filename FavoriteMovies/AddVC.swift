//
//  AddVC.swift
//  FavoriteMovies
//
//  Created by Jan Dammshäuser on 17.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

class AddVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var imgBtn: UIButton!
    @IBOutlet weak var titleTxt: UITextField!
    @IBOutlet weak var imdbTxt: UITextField!
    @IBOutlet weak var plotTxt: UITextField!
    @IBOutlet weak var reasonTxt: UITextField!
    
    private var imagePicker: UIImagePickerController!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        titleTxt.becomeFirstResponder()
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imgView.image = image
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addImgTapped(sender: UIButton!) {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
        imgBtn.setTitle("", forState: .Normal)
    }
    
    @IBAction func addMovieTapped(sender: UIButton!) {
        
        navigationController?.popViewControllerAnimated(true)
    }
    
}
