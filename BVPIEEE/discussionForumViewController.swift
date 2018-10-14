//
//  discussionForumViewController.swift
//  BVPIEEE
//
//  Created by yugantar jain on 04/10/18.
//  Copyright © 2018 yugantar jain. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import GoogleSignIn

class discussionForumViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    var ref: DatabaseReference!
    var handle: DatabaseHandle!
    var author = [String]()
    var message = [String]()
    var oh = CGFloat()
    var chapterChild = "msg_cs"

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
        
        oh = self.view.bounds.height
   
        ref = Database.database().reference()
        tableView.delegate = self
        tableView.dataSource = self
        
        handle = ref.child(chapterChild).observe(.value, with: { (snapshot) in
            for data in snapshot.children.allObjects as! [DataSnapshot]
            {
                let a = data.value as?  [String: AnyObject]
                let b = a?["author"]
                let c = a?["message"]
                if(b == nil || c == nil)
                {
                    self.author.removeAll()
                    self.message.removeAll()
                    continue
                }
                self.author.append(b as! String)
                self.message.append(c as! String)
            }
            self.tableView.reloadData()
        })
        
        let center: NotificationCenter = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardWillShow(notification: )), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification)
    {
        if let keyboardFrame: NSValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue
        {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            let keyboardY = oh - keyboardHeight
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: keyboardY)

        }
    }
    
    func textFieldShouldReturn(_ field : UITextField) -> Bool {
        field.resignFirstResponder()
        self.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.oh)
        return true;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "amcell")
        cell?.textLabel?.text = author[indexPath.row]
        cell?.detailTextLabel?.text = message[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return author.count
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @IBAction func send(_ sender: UIButton) {
        if(textField.hasText)
        {
            let a = Auth.auth().currentUser?.displayName
            let m = textField.text
            let autoID = ref.childByAutoId().key as! String
            ref.child(chapterChild).child(autoID).child("author").setValue(a)
            ref.child(chapterChild).child(autoID).child("message").setValue(m)
        }
        
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
