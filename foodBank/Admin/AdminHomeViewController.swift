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
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var numberServedStay: UILabel!
    @IBOutlet weak var numberServedGo: UILabel!
    @IBOutlet weak var numberServedTotal: UILabel!
    @IBOutlet weak var peopleServed: UILabel!
    
    @IBOutlet weak var setStayButton: UIButton!
    @IBOutlet weak var setGoButton: UIButton!
    
    @IBOutlet weak var showAllMeals: UIButton!
    
    
    @IBAction func showMeals(_ sender: Any) {
        performSegue(withIdentifier: "showMealsSegue", sender: Any?.self)
    }
    
    
    let user = PFUser.current()!
    
    var servedStay = 0
    var servedGo = 0
    var servedTotal = 0
    
    var meals = [PFObject]()
    
    override func viewDidLoad() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

       //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
       //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
        let now = NSDate()
        let cal = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        let midnightOfToday = cal!.startOfDay(for: now as Date)
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        dateLabel.text! = dateFormatter.string(from: date)
        
        let query = PFQuery(className: "Meal")
        query.whereKey("user", equalTo: user)
        query.whereKey("createdAt", greaterThanOrEqualTo: midnightOfToday)
        query.findObjectsInBackground { object, error in
            if object != nil {
                self.meals = object!
            } else {
                print(error.debugDescription)
            }
        }
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var i = 0
        while (i < meals.count){
            let meal = meals[i]
            let mealServedStay = meal.value(forKey: "toStayMeals")!
            let mealServedGo = meal.value(forKey: "toGoMeals")!
            servedGo = servedGo + Int(mealServedGo as! String)!
            servedStay = servedStay + Int(mealServedStay as! String)!
            i += 1
        }
        servedTotal = servedStay + servedGo
        numberServedTotal.text! = String(servedTotal)
        numberServedStay.text! = String(servedStay)
        numberServedGo.text! = String(servedGo)
        peopleServed.text! = String(i)
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func onSetStay(_ sender: Any){
        let maxStay = stayTextField.text!
        user["stay"] = maxStay
        user.saveInBackground { success, error in
            if success {
                print("save user maxStay object")
            } else {
                print(error.debugDescription)
            }
        }
    }
                
    @IBAction func onSetGo(_ sender: Any) {
        let maxGo = goTextField.text!
        user["go"] = maxGo
        user.saveInBackground { success, error in
            if success {
                print("save user maxGo object")
            } else {
                print(error.debugDescription)
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
