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

    var imdbLink: String? {
        return imdb
    }
    
    func getImage() -> UIImage? {
        return nil
    }
}
