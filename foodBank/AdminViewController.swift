//
//  AdminViewController.swift
//  foodBank
//
//  Created by William McPhail on 5/3/22.
//

import UIKit
import Parse

class AdminViewController: UIViewController {
    
    @IBOutlet weak var stayTextField: UITextField!
    @IBOutlet weak var goTextField: UITextField!
    
    
    @IBOutlet weak var numberServedStay: UILabel!
    @IBOutlet weak var numberServedGo: UILabel!
    @IBOutlet weak var numberServedTotal: UILabel!
    
    @IBOutlet weak var setStayButton: UIButton!
    @IBOutlet weak var setGoButton: UIButton!
    
    let user = PFUser.current()!
    let username = user.username

    let max = PFObject(className: "\(username!)Maxes")
    
    @IBAction func onSetStay(_ sender: Any) {
    }
    
    @IBAction func onSetGo(_ sender: Any) {
    }
    
    override func viewDidLoad() {
  
        // Do any additional setup after loading the view.
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
