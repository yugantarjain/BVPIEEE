//
//  adminViewController.swift
//  BVPIEEE
//
//  Created by yugantar jain on 13/11/18.
//  Copyright © 2018 yugantar jain. All rights reserved.
//

import UIKit
import FirebaseDatabase

class adminViewController: UIViewController {
    
    var ref: DatabaseReference!
    var handle: DatabaseHandle!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ref = Database.database().reference()
        
    }
    @IBOutlet weak var chapter: UITextField!
    @IBOutlet weak var by: UITextField!
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var link: UITextField!
    @IBOutlet weak var pic: UITextField!
    @IBOutlet weak var time: UITextField!
    @IBOutlet weak var topic: UITextField!
    @IBOutlet weak var venue: UITextField!
    
    @IBAction func add(_ sender: UIButton) {
        let alert = UIAlertController(title: "Confirmation", message: "Please check all the details", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Default action"), style: .default, handler: { _ in
            print("alert presented")
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Add", comment: "Default action"), style: .default, handler: { _ in
            self.ref.child("All events").child(self.chapter.text!).child("by").setValue(self.by.text!)
            self.ref.child("All events").child(self.chapter.text!).child("date").setValue(self.date.text!)
            self.ref.child("All events").child(self.chapter.text!).child("link").setValue(self.link.text!)
            self.ref.child("All events").child(self.chapter.text!).child("pic").setValue(self.pic.text!)
            self.ref.child("All events").child(self.chapter.text!).child("time").setValue(self.time.text!)
            self.ref.child("All events").child(self.chapter.text!).child("topic").setValue(self.topic.text!)
            self.ref.child("All events").child(self.chapter.text!).child("venue").setValue(self.venue.text!)
//            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
