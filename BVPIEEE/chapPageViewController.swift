//
//  chapPageViewController.swift
//  BVPIEEE
//
//  Created by yugantar jain on 02/10/18.
//  Copyright © 2018 yugantar jain. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class chapPageViewController: UIViewController {
    
    var code2: String!
    var navTitle: String!
    var ref: DatabaseReference!
    var handle: DatabaseHandle!
    var member = false

    @IBOutlet weak var image: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = navTitle
        image.image = UIImage(named: code2)
        
        ref = Database.database().reference()
        
        let a = Auth.auth().currentUser?.email
        handle = ref.child("ieee_emails").observe(.childAdded, with: { (snapshot) in
            if let b = snapshot.value as? String
            {
                if(a == b)
                {
                    self.member = true
                }
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toDiscussionForum(_ sender: UIButton) {
        
        if(member == true)
        {
            performSegue(withIdentifier: "toDF", sender: self)
        }
        else
        {
            let alert = UIAlertController(title: "Content Locked", message: "This feature can be accessed by IEEE members only", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Close", comment: "Default action"), style: .default, handler: { _ in
                print("alert presented")
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        let a = segue.destination as! discussionForumViewController
        let b = segue.destination as! joinViewController
        // Pass the selected object to the new view controller.
        if(segue.identifier == "toDF")
        {
            a.chapterChild = code2
        }
        else if(segue.identifier == "fbPage")
        {
            b.link = ""
        }
    }
    @IBAction func toFB(_ sender: UIButton) {
        performSegue(withIdentifier: "fbPage", sender: self)
    }
    
   
}
