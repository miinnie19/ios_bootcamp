//
//  ViewController.swift
//  Rush00
//
//  Created by Melissa NAIDOO on 2018/10/06.
//  Copyright © 2018 Melissa NAIDOO. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate  {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var fourtytwoWebView: UIWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = (self as WKNavigationDelegate)
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let url = URL(string: "https://api.intra.42.fr/oauth/authorize?client_id=bc9d5ab181916b0b8501e09e4ac8af8e891e56f6709b9200a0dee44808c19b1f&redirect_uri=https%3A%2F%2Fwww.mnaidooRush.com&response_type=code")
        webView.load(URLRequest(url: url!))
        webView.allowsBackForwardNavigationGestures = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

