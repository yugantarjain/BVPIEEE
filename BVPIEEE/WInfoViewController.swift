//
//  WInfoViewController.swift
//  BVPIEEE
//
//  Created by yugantar jain on 29/09/18.
//  Copyright © 2018 yugantar jain. All rights reserved.
//

import UIKit
import FirebaseDatabase
import WebKit


class WInfoViewController: UIViewController, WKUIDelegate {
    
    var text: String!
    var webView: WKWebView!
    var link: String!
    
    @IBOutlet weak var by: UILabel!
    @IBOutlet weak var topic: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var venue: UILabel!
    @IBOutlet weak var regButton: UIButton!
    
    var key: String!
    
    var ref: DatabaseReference!
    var handle: DatabaseHandle!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ref = Database.database().reference()
        
        handle = ref.child("All events").child(text).observe(.childAdded, with: { (snapshot) in
            self.key = snapshot.key
            switch(self.key)
            {
            case "by": self.by.text = snapshot.value as? String
            case "topic": self.topic.text = snapshot.value as? String
            case "date": self.date.text = snapshot.value as? String
            case "time": self.time.text = snapshot.value as? String
            case "venue": self.venue.text = snapshot.value as? String
            case "link": self.link = snapshot.value as? String
            default: print("default")
            }
        })
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        if(self.link.hasPrefix("htt")==false)
        {
            self.regButton.isEnabled = false
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openLink(_ sender: UIButton) {
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
        let myURL = URL(string: self.link)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
    }
    
}
