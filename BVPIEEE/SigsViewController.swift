//
//  SigsViewController.swift
//  BVPIEEE
//
//  Created by yugantar jain on 14/10/18.
//  Copyright © 2018 yugantar jain. All rights reserved.
//

import UIKit

class SigsViewController: UIViewController {
    
    var code: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SigClicked(_ sender: UIButton) {
        code = sender.titleLabel?.text
        switch code {
        case "CODE-X": code = "msg_codex"
        case "DRISHTI": code = "msg_drishti"
        case "RAU": code = "msg_rau"
        case "BQC": code = "msg_bqc"
        case "E-CELL": code = "msg_ecell"
        case "GAMMA": code = "msg_gamma"
        default: code = "messages"
        }
        performSegue(withIdentifier: "sigPage", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        let a = segue.destination as! chapPageViewController
        // Pass the selected object to the new view controller.
        a.code2 = code
    }
    
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        dismiss(animated: true) { }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    */

}
