//
//  DetailVC.swift
//  FavoriteMovies
//
//  Created by Jan Dammshäuser on 17.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var reasonLbl: UILabel!
    @IBOutlet weak var plotLbl: UILabel!
    
    private var _movie: Movie!
    
    convenience init(movie: Movie) {
        self.init(nibName: "DetailVC", bundle: nil)
        
        _movie = movie
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.image = _movie.getImage()
        titleLbl.text = _movie.title
        reasonLbl.text = _movie.reason
        plotLbl.text = _movie.plot
    }
    
    @IBAction func doneTapped(sender: UIButton!) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func imdbTapped(sender: UIButton!) {
        print(_movie.imdbLink)
    }
    
}
