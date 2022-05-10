//
//  AdminFeedViewController.swift
//  foodBank
//
//  Created by William McPhail on 5/9/22.
//

import UIKit
import Parse

class AdminFeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let user = PFUser.current()!
    var meals = [PFObject]()
    
    @IBAction func onBack(_ sender: Any) {
        dismiss(animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meal = meals[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell") as! MealCell
        
        let identifier = meal["identifier"] as! String
        let mealsStay = meal["toStayMeals"] as! String
        let mealsGo = meal["toGoMeals"] as! String
        var notes = ""
        
        if identifier != "Guest" {
            notes = meal["notes"] as! String
        }
        
        cell.userLabel.text! = "Username: " + identifier
        cell.mealsStayLabel.text! = "Meals to Stay: " + mealsStay
        cell.mealsGoLabel.text! = "Meals to Go: " + mealsGo
        cell.notesLabel.text! = "Notes: " + notes
        
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let now = NSDate()
        let cal = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        let midnightOfToday = cal!.startOfDay(for: now as Date)
        
        let query = PFQuery(className: "Meal")
        
        query.whereKey("user", equalTo: user)
        query.whereKey("createdAt", greaterThanOrEqualTo: midnightOfToday)
        query.findObjectsInBackground { object, error in
            if object != nil {
                self.meals = object!
                self.tableView.reloadData()
            } else {
                print(error.debugDescription)
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

}
