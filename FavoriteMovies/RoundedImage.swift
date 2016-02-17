//
//  RoundedImage.swift
//  FavoriteMovies
//
//  Created by Jan Dammshäuser on 17.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

class RoundedImage: UIImageView {

    override func awakeFromNib() {
        layer.cornerRadius = 10
        clipsToBounds = true
    }

}
