//
//  CoreDataService.swift
//  FavoriteMovies
//
//  Created by Jan Dammshäuser on 17.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataService {
    static let inst = CoreDataService()
    
    private var _movies = [Movie]()
    
    private let APP: AppDelegate
    private let MOC: NSManagedObjectContext
    private let FETCH: NSFetchRequest
    
    var movies: [Movie] {
        return _movies
    }
    
    init() {
        APP = UIApplication.sharedApplication().delegate as! AppDelegate
        MOC = APP.managedObjectContext
        FETCH = NSFetchRequest(entityName: "Movie")
    }
    
    func fetchData() {
        do {
            let result = try MOC.executeFetchRequest(FETCH)
            guard let resultList = result as? [Movie] else {
                print("Corrupted Data in CoreData")
                return
            }
            _movies = resultList
        } catch {
            print("Nothing loaded from CoreData")
        }
    }
    
    func saveData(img: UIImage, title: String, imdb: String, plot: String, reason: String) {
        
        
        fetchData()
    }
    

}