//
//  LoginViewController.swift
//  FaceSpace22
//
//  Created by Jonavon Smith on 5/26/20.
//  Copyright © 2020 FaceSpaceInc. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
       
    }
    
    func setUpElements() {
        
        // Hide Error label
        errorLabel.alpha = 0
    }

    

    @IBAction func loginTapped(_ sender: Any) {
        
        // TODO: Validate text fields
        
        //Create cleaned versions of the text field
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
                
            }
            else {
                
                let showAllViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.showAllViewController) as? ShowAllViewController
                
                self.view.window?.rootViewController = showAllViewController
                self.view.window?.makeKeyAndVisible()
        }
        
    }
    
}
  

}
