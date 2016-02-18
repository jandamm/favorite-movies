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
        
        setLogo()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        titleTxt.becomeFirstResponder()
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imgView.image = image
        imgBtn.setTitle("", forState: .Normal)
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addImgTapped(sender: UIButton!) {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addMovieTapped(sender: UIButton!) {
        guard let img = imgView.image, let title = titleTxt.text, let imdb = imdbTxt.text, let plot = plotTxt.text, let reason = reasonTxt.text else {
            return
        }
        
        let saved = CoreDataService.inst.saveData(img, title: title, imdb: imdb, plot: plot, reason: reason)
        
        if saved {
            navigationController?.popViewControllerAnimated(true)
        }
    }
    
}
