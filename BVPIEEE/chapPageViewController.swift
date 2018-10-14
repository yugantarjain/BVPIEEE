//
//  chapPageViewController.swift
//  BVPIEEE
//
//  Created by yugantar jain on 02/10/18.
//  Copyright © 2018 yugantar jain. All rights reserved.
//

import UIKit

class chapPageViewController: UIViewController {
    
    var code2: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(code2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toDiscussionForum(_ sender: UIButton) {
        performSegue(withIdentifier: "toDF", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        let a = segue.destination as! discussionForumViewController
        // Pass the selected object to the new view controller.
        a.chapterChild = code2
    }
    
   
}
