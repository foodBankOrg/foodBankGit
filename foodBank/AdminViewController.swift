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
    
    let user = PFUser.current()!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if user["maxMealsStay"] as! Int != 0{
            stayTextField.text = user["maxMealStay"] as! String
        }
        if user["maxMealsGo"] as! Int != 0{
            goTextField.text = user["maxMealStay"] as! String
        }
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
