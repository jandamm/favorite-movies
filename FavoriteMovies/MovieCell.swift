//
//  MovieCell.swift
//  FavoriteMovies
//
//  Created by Jan Dammshäuser on 17.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var reasonLbl: UILabel!
    
    private var _link: String!
    
    func initializeCell(favMovie: Movie) {
        _link = favMovie.imdbLink
        titleLbl.text = favMovie.title
        reasonLbl.text = favMovie.reason
        imgView.image = favMovie.getImage()
    }
    
    @IBAction func imdbTapped(sender: UIButton!) {
        NSNotificationCenter.defaultCenter().postNotificationName("imdbTapped", object: nil, userInfo: ["link": _link])
    }
    
}
