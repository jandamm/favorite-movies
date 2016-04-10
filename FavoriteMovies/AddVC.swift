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
    
    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let mov = movie {
            imgView.image = mov.getImage()
            titleTxt.text = mov.title
            imdbTxt.text = mov.imdb
            plotTxt.text = mov.plot
            reasonTxt.text = mov.reason
            clearImgBtnTitle()
        }
        
        setLogo()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        titleTxt.becomeFirstResponder()
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imgView.image = image
        clearImgBtnTitle()
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    private func clearImgBtnTitle() {
        imgBtn.setTitle("", forState: .Normal)
    }
    
    @IBAction func addImgTapped(sender: UIButton!) {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addMovieTapped(sender: UIButton!) {
        guard let img = imgView.image, let title = titleTxt.text where title != "", let imdb = imdbTxt.text where imdb != "", let plot = plotTxt.text where plot != "", let reason = reasonTxt.text where reason != "" else {
            return
        }
        
        let saved = CoreDataService.inst.saveData(movie, img: img, title: title, imdb: imdb, plot: plot, reason: reason)
        
        if saved {
            navigationController?.popViewControllerAnimated(true)
        }
    }
    
}
