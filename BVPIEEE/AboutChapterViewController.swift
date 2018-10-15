//
//  AboutChapterViewController.swift
//  BVPIEEE
//
//  Created by yugantar jain on 15/10/18.
//  Copyright © 2018 yugantar jain. All rights reserved.
//

import UIKit

class AboutChapterViewController: UIViewController {
    
    var chap: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "About " + chap 
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
