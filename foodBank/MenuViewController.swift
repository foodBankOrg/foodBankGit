//
//  MenuViewController.swift
//  foodBank
//
//  Created by William McPhail on 4/1/22.
//

import UIKit
import Parse

class MenuViewController: UIViewController {

    @IBOutlet weak var currentUserLabel: UILabel!
    
    @IBOutlet weak var guestLoginButton: UIButton!
    
    @IBOutlet weak var memberLoginButton: UIButton!
    @IBOutlet weak var memberIDField: UITextField!
        
    let defaults = UserDefaults.standard
    
    @IBAction func onMemberLogin(_ sender: Any) {
        defaults.set(memberIDField.text!, forKey: "memberID")
    }
    
    override func viewDidLoad() {
        let user = PFUser.current()!
        currentUserLabel.text = "Current Location/ Username: \(user.username!)"
        
        super.viewDidLoad()
        guestLoginButton.layer.cornerRadius = 12
        guestLoginButton.layer.borderWidth = 1
        guestLoginButton.layer.borderColor = UIColor.black.cgColor
        
        memberLoginButton.layer.cornerRadius = 12
        memberLoginButton.layer.borderWidth = 1
        memberLoginButton.layer.borderColor = UIColor.black.cgColor
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "loginViewController")
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        delegate.window?.rootViewController = loginViewController
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
