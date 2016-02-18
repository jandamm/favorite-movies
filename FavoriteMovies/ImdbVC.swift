//
//  ImdbVC.swift
//  FavoriteMovies
//
//  Created by Jan Dammshäuser on 18.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit
import WebKit

class ImdbVC: UIViewController {

    @IBOutlet weak var webFrame: UIView!
    
    private var _webView: WKWebView!
    private var _link: String!
    
    convenience init(link: String) {
        self.init(nibName: "ImdbVC", bundle: nil)
        
        _link = link
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _webView = WKWebView()
        webFrame.addSubview(_webView)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let url = NSURL(string: _link)!
        let request = NSURLRequest(URL: url)
        
        _webView.frame = CGRectMake(0, 0, webFrame.bounds.width, webFrame.bounds.height)
        
        _webView.loadRequest(request)
    }
    
    @IBAction func doneTapped(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
