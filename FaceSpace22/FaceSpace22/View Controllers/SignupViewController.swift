//
//  SignupViewController.swift
//  FaceSpace22
//
//  Created by Jonavon Smith on 5/26/20.
//  Copyright © 2020 FaceSpaceInc. All rights reserved.
//

import UIKit
import Firebase

class SignupViewController: UIViewController {

    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
      // Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it resturns the error message

    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
        
            return "Please fill in all fields."
        }
        
        // Check if password is secure
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password not secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number"
            
        }
        
    
        
        return nil
    }

    @IBAction func signUpTapped(_ sender: Any) {
   
        //Valdate the fields
        let error = validateFields()
        
        if error != nil {
            
            // There is something wrong with fields, show error message
           showError(error!)
        }
        else {
        
            
            // Create cleaned versins of the data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                //Check for errors
                if err != nil {
                    
                    //There was an error creating the user
                    self.showError("Error creating user")
                }
                else {
                    
                    // User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname":firstName, "lastName":lastName, "uid": result!.user.uid ]) { (error) in
                        
                        if error != nil {
                            //Show error message
                            self.showError("Error saving user data")
                        }
                    }
                    
                    //Transition to the home screen
                    self.transitionToHome()
                    
                }
            }
            
        }
    }

    
    func showError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1

        
    }
    
    func transitionToHome() {
        
        let showAllViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.showAllViewController) as? ShowAllViewController
        
        view.window?.rootViewController = showAllViewController
        view.window?.makeKeyAndVisible()
        
    }
    
    
}
