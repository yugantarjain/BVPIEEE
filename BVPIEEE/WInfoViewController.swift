//
//  WInfoViewController.swift
//  BVPIEEE
//
//  Created by yugantar jain on 29/09/18.
//  Copyright © 2018 yugantar jain. All rights reserved.
//

import UIKit
import WebKit

class WInfoViewController: UIViewController, WKUIDelegate {
    
    var text: String!
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        abcd.text = text;
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var abcd: UILabel!
    
    @IBAction func link(_ sender: Any) {
        let myURL = URL(string: "https://www.google.com")
        let myRequest = URLRequest(url: myURL!)
        view = webView
        webView.load(myRequest)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
