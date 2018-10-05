//
//  FirstViewController.swift
//  BVPIEEE
//
//  Created by yugantar jain on 04/09/18.
//  Copyright © 2018 yugantar jain. All rights reserved.
//

import UIKit
import FirebaseDatabase

class FirstViewController: UIViewController {
    
    var ref: DatabaseReference!
    var handle: DatabaseHandle!
    var z: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        
        ref = Database.database().reference()
        
        handle = ref.child("Next event").observe(.childAdded, with: { (snapshot) in
            self.z = snapshot.key
            switch(self.z)
            {
            case "topic" : self.topic.text = snapshot.value as? String
            case "desc" : self.desc.text = snapshot.value as? String
            case "date" : self.date.text = snapshot.value as? String
            case "time" : self.time.text = snapshot.value as? String
            case "venue" : self.venue.text = snapshot.value as? String
            default: print("default")

            }
        })
        
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
    @IBOutlet weak var topic: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var venue: UILabel!
    
    @IBOutlet var rb: [UIButton]!
    
    @IBAction func goToChapters(_ sender: UIButton) {
        performSegue(withIdentifier: "toChapters", sender: self)
    }
}
