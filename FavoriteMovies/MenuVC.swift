//
//  ViewController.swift
//  FavoriteMovies
//
//  Created by Jan Dammshäuser on 17.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

class MenuVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLogo()
        
        CoreDataService.inst.fetchData()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "openWebView:", name: "imdbTapped", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reloadTableView", name: "reloadData", object: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func openWebView(notif: NSNotification) {
        guard let info = notif.userInfo as? Dictionary <String, String>, let link = info["link"] else {
            print("No link provided")
            return
        }
        
        let view = ImdbVC(link: link)
        
        presentViewController(view, animated: true, completion: nil)
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let movie = CoreDataService.inst.movies[indexPath.row]
        let view = DetailVC(movie: movie)
        
        presentViewController(view, animated: true, completion: nil)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CoreDataService.inst.movies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("MovieCell") as? MovieCell else {
            return MovieCell()
        }
        
        let movie = CoreDataService.inst.movies[indexPath.row]
        cell.initializeCell(movie)
        
        return cell
    }
    
}

