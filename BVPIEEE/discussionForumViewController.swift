//
//  discussionForumViewController.swift
//  BVPIEEE
//
//  Created by yugantar jain on 04/10/18.
//  Copyright © 2018 yugantar jain. All rights reserved.
//

import UIKit
import FirebaseDatabase

class discussionForumViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    var ref: DatabaseReference!
    var handle: DatabaseHandle!
    var author = [String]()
    var message = [String]()
    var oh = CGFloat()
    var no = 0
    var check: CGFloat = 0

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.delegate = self
        
        oh = self.view.bounds.height
        print(oh)
   
        ref = Database.database().reference()
        tableView.delegate = self
        tableView.dataSource = self
        
        handle = ref.child("msg_cs").observe(.value, with: { (snapshot) in
            for data in snapshot.children.allObjects as! [DataSnapshot]
            {
                let a = data.value as?  [String: AnyObject]
                let b = a?["author"]
                let c = a?["message"]
                self.author.append(b as! String)
                self.message.append(c as! String)
                self.tableView.reloadData()
            }
        })
        
        let center: NotificationCenter = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardDidShow(notification: )), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        center.addObserver(self, selector: #selector(keyboardDidHide(notification: )), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardDidShow(notification: Notification)
    {
        print("show")
        let info: NSDictionary = notification.userInfo! as NSDictionary
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        if(check == 0)
        {
            check = keyboardSize.height
        }
        let keyboardY = oh - check
        print(keyboardY)
        print(keyboardSize.height)
        print(self.oh)
        if(no == 0)
        {
            UIView.animate(withDuration: 0.50) {
                self.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: keyboardY)
                self.no = self.no + 1;
            }
        }
    }
    
    @objc func keyboardDidHide(notification: Notification)
    {
        print("hide")
        UIView.animate(withDuration: 0.50) {
            print(self.oh)
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.oh)
            self.no = 0
//            self.check = 1
        }
    }
    
    func textFieldShouldReturn(_ field : UITextField) -> Bool {
//        self.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: oh)
        field.resignFirstResponder()
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
