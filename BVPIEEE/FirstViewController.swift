//
//  FirstViewController.swift
//  BVPIEEE
//
//  Created by yugantar jain on 04/09/18.
//  Copyright © 2018 yugantar jain. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for rb in rb
        {
            //rb.bounds.size.height = rb.bounds.size.width;
            rb.layer.cornerRadius = rb.bounds.size.height/2;
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBOutlet var rb: [UIButton]!
    
    @IBAction func goToChapters(_ sender: UIButton) {
        performSegue(withIdentifier: "toChapters", sender: self)
    }
}
