//
//  GuestViewController.swift
//  foodBank
//
//  Created by William McPhail on 4/15/22.
//

import UIKit
import Parse

class GuestViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        minusButtonStay.layer.cornerRadius = 12
        minusButtonStay.layer.borderWidth = 1
        minusButtonStay.layer.borderColor = UIColor.black.cgColor
        
        minusButtonGo.layer.cornerRadius = 12
        minusButtonGo.layer.borderWidth = 1
        minusButtonGo.layer.borderColor = UIColor.black.cgColor
        
        plusButtonStay.layer.cornerRadius = 12
        plusButtonStay.layer.borderWidth = 1
        plusButtonStay.layer.borderColor = UIColor.black.cgColor
        
        plusButtonGo.layer.cornerRadius = 12
        plusButtonGo.layer.borderWidth = 1
        plusButtonGo.layer.borderColor = UIColor.black.cgColor
        
        submitButton.layer.cornerRadius = 12
        submitButton.layer.borderWidth = 1
        submitButton.layer.borderColor = UIColor.black.cgColor

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var stayCountLabel: UILabel!
    @IBOutlet weak var goCountLabel: UILabel!
    
    @IBOutlet weak var minusButtonStay: UIButton!
    @IBOutlet weak var plusButtonStay: UIButton!
    
    @IBOutlet weak var minusButtonGo: UIButton!
    @IBOutlet weak var plusButtonGo: UIButton!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBOutlet weak var submitButton: UIButton!
        
    @IBAction func onMinusButtonStay(_ sender: Any) {
        var count = Int(stayCountLabel.text!) ?? 0
        if count != 0{
            count = (count) - 1
        }
        let string = String(count)
        stayCountLabel.text = string
        
    }
    
    @IBAction func onPlusButtonStay(_ sender: Any) {
        var count = Int(stayCountLabel.text!) ?? 0
        count = count + 1
        let string = String(count)
        stayCountLabel.text = string
    }
    
    @IBAction func onMinusButtonGo(_ sender: Any) {
        var count = Int(goCountLabel.text!) ?? 0
        if count != 0{
            count = (count) - 1
        }
        let string = String(count)
        goCountLabel.text = string
    }
    
    @IBAction func onPlusButtonGo(_ sender: Any) {
        var count = Int(goCountLabel.text!) ?? 0
        count = count + 1
        let string = String(count)
        goCountLabel.text = string
    }
    
    @IBAction func onBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
    let defaults = UserDefaults.standard
    
    @IBAction func onSubmit(_ sender: Any) {
        let name = defaults.string(forKey: "username")
        let meal = PFObject(className: "\(name!)Meals")
        meal["user"] = "guest"
        meal["toStayMeals"] = stayCountLabel.text!
        meal["toGoMeals"] = goCountLabel.text!
        
        meal.saveInBackground { success, error in
            if success{
                self.dismiss(animated: true, completion: nil)
                print("Meal saved to DB")
            } else {
                print("Error saving meal to DB")
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
