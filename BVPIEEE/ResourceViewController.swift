//
//  ResourceViewController.swift
//  BVPIEEE
//
//  Created by yugantar jain on 12/11/18.
//  Copyright © 2018 yugantar jain. All rights reserved.
//

import UIKit
import WebKit
import FirebaseDatabase

class ResourceViewController: UIViewController, WKUIDelegate {
    
    var ref: DatabaseReference!
    var handle: DatabaseHandle!
    
    var link: String!
    var navTitle: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = navTitle
        
        if(self.link.hasPrefix("htt")==false)
        {
            let alert = UIAlertController(title: "File Unavailable", message: "Will be uploaded soon :)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Close", comment: "Default action"), style: .default, handler: { _ in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            let myURL = URL(string: self.link)
            let myRequest = URLRequest(url: myURL!)
            resource.load(myRequest)
        }
    }
    
    @IBOutlet weak var resource: WKWebView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
