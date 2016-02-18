//
//  NavigationTitle.swift
//  FavoriteMovies
//
//  Created by Jan Dammshäuser on 18.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setLogo() {
        let logo = UIImage(named: "logo.png")
        
        let imageView = UIImageView(image:logo)
        imageView.layer.bounds = CGRect(x: 0, y: 0, width: 166, height: 36)
        imageView.contentMode = .ScaleAspectFit
        
        self.navigationItem.titleView = imageView
    }
}