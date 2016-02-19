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
    
    func deleteData(index: Int) {
        let item = _movies[index]
        
        MOC.deleteObject(item)
        
        saveMOC()
        
        fetchData()
        
        reloadNotif()
    }
    
    func saveData(img: UIImage, title: String, imdb: String, plot: String, reason: String) -> Bool {
        guard let entity = NSEntityDescription.entityForName("Movie", inManagedObjectContext: MOC) else {
            print("Could not create entity")
            return false
        }
        let newMovie = Movie(entity: entity, insertIntoManagedObjectContext: MOC)
        
        newMovie.saveImage(img)
        newMovie.title = title
        newMovie.imdb = imdb
        newMovie.plot = plot
        newMovie.reason = reason
        
        MOC.insertObject(newMovie)
        
        guard saveMOC() else {
            return false
        }
        
        fetchData()
        
        reloadNotif()
        
        return true
    }
    
    private func reloadNotif() {
        NSNotificationCenter.defaultCenter().postNotificationName("reloadData", object: nil)
    }
    
    private func saveMOC() -> Bool {
        do {
            try MOC.save()
            return true
        } catch {
            print("Couldn't save to CoreData")
            return false
        }
    }

}