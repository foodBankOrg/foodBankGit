//
//  LoginViewController.swift
//  foodBank
//
//  Created by William McPhail on 4/1/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var adminLoginButton: UIButton!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

       //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
       //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
        super.viewDidLoad()
        signInButton.layer.cornerRadius = 12
        signInButton.layer.borderWidth = 1
        signInButton.layer.borderColor = UIColor.black.cgColor
        
        signUpButton.layer.cornerRadius = 12
        signUpButton.layer.borderWidth = 1
        signUpButton.layer.borderColor = UIColor.black.cgColor
        
        adminLoginButton.layer.cornerRadius = 12
        adminLoginButton.layer.borderWidth = 1
        adminLoginButton.layer.borderColor = UIColor.black.cgColor
        
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        PFUser.logInWithUsername(inBackground: username, password: password) { user, Error in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                self.defaults.set(username, forKey: "username")
            } else {
                print("Error: \(String(describing: Error))")
            }
        }
    }
    
    @IBAction func onAdminPortal(_ sender: Any) {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        PFUser.logInWithUsername(inBackground: username, password: password) { user, Error in
            if user != nil {
                self.performSegue(withIdentifier: "adminSegue", sender: nil)
                self.defaults.set(username, forKey: "username")
            } else {
                print("Error: \(String(describing: Error))")
            }
        }
    }
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameTextField.text!
        user.password = passwordTextField.text!
        user.setValue("3", forKey: "stay")
        user.setValue("3", forKey: "go")
        user.signUpInBackground { success, Error in
            if success{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                self.defaults.set(self.usernameTextField.text!, forKey: "username")
            } else {
                print("Error: \(String(describing: Error))")
            }
        }
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
