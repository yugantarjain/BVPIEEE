//
//  chapPageViewController.swift
//  BVPIEEE
//
//  Created by yugantar jain on 02/10/18.
//  Copyright © 2018 yugantar jain. All rights reserved.
//

import UIKit

class chapPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toDiscussionForum(_ sender: UIButton) {
        performSegue(withIdentifier: "toDF", sender: self)
    }
    
    
    
    /*    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
