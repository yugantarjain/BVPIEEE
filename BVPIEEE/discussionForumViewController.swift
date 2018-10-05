//
//  discussionForumViewController.swift
//  BVPIEEE
//
//  Created by yugantar jain on 04/10/18.
//  Copyright © 2018 yugantar jain. All rights reserved.
//

import UIKit
import FirebaseDatabase

class discussionForumViewController: UIViewController {
    
    var ref: DatabaseReference!
    var handle: DatabaseHandle!
    var ids =  [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var sender: UILabel!
        var message: UILabel!
        
        ref = Database.database().reference()
        
        handle = ref.child("msg_cs").observe(.value, with: { (snapshot) in
            for data in snapshot.children.allObjects as! [DataSnapshot]
            {
                let a = data.value as?  [String: AnyObject]
                let b = a?["author"]
                let c = a?["message"]
                print(b)
                print(c)
            }
        })
        
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
