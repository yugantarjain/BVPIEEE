//
//  SignInViewController.swift
//  BVPIEEE
//
//  Created by yugantar jain on 02/10/18.
//  Copyright © 2018 yugantar jain. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class SignInViewController: UIViewController, GIDSignInUIDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let sib = GIDSignInButton()
        sib.frame = CGRect(x: 5, y: 50, width: view.frame.width-10, height: 30)
        view.addSubview(sib)
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().uiDelegate = self
        
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
