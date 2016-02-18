//
//  Movie.swift
//  FavoriteMovies
//
//  Created by Jan Dammshäuser on 17.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Movie: NSManagedObject {

    var imdbLink: String {
        guard let id = imdb else {
            return "http://www.imdb.com/"
        }
        
        return "http://www.imdb.com/title/\(id)/"
    }
    
    func getImage() -> UIImage? {
        guard let data = image else {
            return nil
        }
        
        return UIImage(data: data)
    }
    
    func saveImage(img: UIImage) {
        let imgData = UIImagePNGRepresentation(img)
        image = imgData
    }
}
