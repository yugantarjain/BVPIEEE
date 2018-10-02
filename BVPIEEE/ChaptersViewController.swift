//
//  chaptersViewController.swift
//  BVPIEEE
//
//  Created by yugantar jain on 01/10/18.
//  Copyright © 2018 yugantar jain. All rights reserved.
//

import UIKit

class ChaptersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chapterClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "chapPage", sender: self)
    }
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        dismiss(animated: true) { }
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
