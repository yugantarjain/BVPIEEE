//
//  joinViewController.swift
//  BVPIEEE
//
//  Created by yugantar jain on 14/10/18.
//  Copyright © 2018 yugantar jain. All rights reserved.
//

import UIKit
import WebKit

class joinViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    var link = "https://www.ieee.org/membership/join/index.html"
    let a = UIButton()

    @IBOutlet weak var joinIEEE: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let myURL = URL(string: self.link)
        let myRequest = URLRequest(url: myURL!)
        joinIEEE.load(myRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
