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
    var fbLink: String!

    @IBOutlet weak var image: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = navTitle
        image.image = UIImage(named: code2)
        
        switch(navTitle)
        {
        case "RAS": fbLink = "https://www.facebook.com/bvpieeeras"
        case "CS": fbLink = "https://www.facebook.com/BVPIEEECS"
        case "IAS": fbLink = "https://www.facebook.com/BVPIEEE-IAS-483730548444337/"
        case "HKN": fbLink = "https://www.facebook.com/IEEE-HKN-Bvcoe-275757819137835/"
        case "WIE": fbLink = "https://www.facebook.com/WieMeet2k15/"
        case "CODE-X": fbLink = "https://www.facebook.com/bvpieeecodex/"
        case "DRISHTI": fbLink = "https://www.facebook.com/drishti.bvpieee.7/"
        case "BQC": fbLink = "https://www.facebook.com/BVCOE-Quizzing-Club-2048443498818392/?modal=admin_todo_tour"
        case "E-CELL": fbLink = "https://www.facebook.com/pages/category/Community/E-Cell-BVPIEEE-648188411872430/"
        case "GAMMA": fbLink = "https://www.facebook.com/BVP-IEEE-GAMMA-310761423006269/"
        default: print("link not available")
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
        // Pass the selected object to the new view controller.
        if(segue.identifier == "toDF")
        {
            let a = segue.destination as! discussionForumViewController
            a.chapterChild = code2
        }
        else if(segue.identifier == "toFBPage")
        {
            let b = segue.destination as! fbViewController
            b.link = fbLink
            b.navTitle = "(" + self.navTitle + ")"
        }
        else if(segue.identifier == "toAboutChap")
        {
            let c = segue.destination as! AboutChapterViewController
            c.chap = navTitle
        }
        
    }
    @IBAction func toFB(_ sender: UIButton) {
        performSegue(withIdentifier: "toFBPage", sender: self)
    }
    
    @IBAction func toAboutChapter(_ sender: UIButton) {
        performSegue(withIdentifier: "toAboutChap", sender: self)
    }
    
    
   
}
