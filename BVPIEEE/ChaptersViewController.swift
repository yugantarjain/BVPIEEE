//
//  chaptersViewController.swift
//  BVPIEEE
//
//  Created by yugantar jain on 01/10/18.
//  Copyright © 2018 yugantar jain. All rights reserved.
//

import UIKit

class ChaptersViewController: UIViewController {
    
    var code: String!
    var code3: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chapterClicked(_ sender: UIButton) {
        code3 = sender.titleLabel?.text
        switch code3 {
        case "RAS": code = "msg_ras"
        case "CS": code = "msg_cs"
        case "IAS": code = "msg_ias"
        case "HKN": code = "msg_hkn"
        case "WIE": code = "msg_wie"
        default: code = "messages"
        }
        performSegue(withIdentifier: "chapPage", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        let a = segue.destination as! chapPageViewController
        
        // Pass the selected object to the new view controller.
        a.code2 = code
        a.navTitle = code3
    }
    
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        dismiss(animated: true) { }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation

}
