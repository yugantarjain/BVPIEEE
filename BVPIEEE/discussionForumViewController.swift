//
//  discussionForumViewController.swift
//  BVPIEEE
//
//  Created by yugantar jain on 04/10/18.
//  Copyright © 2018 yugantar jain. All rights reserved.
//

import UIKit
import FirebaseDatabase
import MessageKit
import Messages
import MessageUI


class discussionForumViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var ref: DatabaseReference!
    var handle: DatabaseHandle!
    var author = [String]()
    var message = [String]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        var sender =  UILabel()
//        var message = UILabel()
//        var y = 18

        
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
                print(b)
                print(c)
//                sender.text = b as? String
//                message.text = c as? String
//                print(sender)
//                print(message)
//                sender.frame = CGRect(x: 10, y: y, width: 50, height: 18)
//                y = y+25
//                message.frame = CGRect(x: 10, y: y, width: 50, height: 18)
//                message.backgroundColor = UIColor.lightGray
//                y = y+25
//                self.view.addSubview(sender)
//                self.view.addSubview(message)
                
                
                
            }
        })
        
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
