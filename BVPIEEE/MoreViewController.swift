//
//  MoreViewController.swift
//  BVPIEEE
//
//  Created by yugantar jain on 13/11/18.
//  Copyright © 2018 yugantar jain. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class MoreViewController: UIViewController {
    
    var ref: DatabaseReference!
    var handle: DatabaseHandle!
    var member = false
    var admin = false
    var a: String!
    @IBOutlet weak var adminButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ref = Database.database().reference()
        a = Auth.auth().currentUser?.email
        
        handle = ref.child("admin").observe(.childAdded, with: { (snap) in
            if let c = snap.value as? String
            {
                if(self.a == c)
                {
                    self.admin = true
                    self.adminButton.isHidden = false
                    return
                }
            }
        })
        handle = ref.child("ieee_emails").observe(.childAdded, with: { (snapshot) in
            if let b = snapshot.value as? String
            {
                if(self.a == b)
                {
                    self.member = true
                    return
                }
            }
        })
    }
    
    @IBAction func membership(_ sender: UIButton) {
        var title: String!
        var message: String!
        
        if(member == true)
        {
            title = "Member"
            message = a;
        }
        else
        {
            title = "Non Member"
            message = "Join IEEE to avail full benefits"
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Close", comment: "Default action"), style: .default, handler: { _ in
            print("alert presented")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func signOut(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        performSegue(withIdentifier: "back", sender: self)
    }
    @IBAction func contact(_ sender: UIButton) {
    }
    @IBAction func adminPage(_ sender: UIButton) {
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
