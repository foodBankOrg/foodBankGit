//
//  AdminTableViewController.swift
//  foodBank
//
//  Created by Mia Elena on 5/25/22.
//

import UIKit
import Parse 

class AdminTableViewController: UITableViewController {
    
    let myRefreshControl = UIRefreshControl()
    
    let user = PFUser.current()
    @objc var meals = [PFObject]()
    var numberOfNotes: Int!
    
    @IBOutlet var adminTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 50.0  //Give an approximation here
        tableView.rowHeight = UITableView.automaticDimension
        
        myRefreshControl.addTarget(self, action: #selector(getter: meals), for: .valueChanged)
        tableView.refreshControl = myRefreshControl

        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = true

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        // myRefreshControl.addTarget(self, action: #selector(loadNotes), for: .valueChanged)
        // tableView.refreshControl = myRefreshControl
        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl = myRefreshControl

        
        let now = NSDate()
        let cal = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        let midnightOfToday = cal!.startOfDay(for: now as Date)
        
        let query = PFQuery(className: "Meal")
        
        query.whereKey("user", equalTo: user)
        query.whereKey("createdAt", greaterThanOrEqualTo: midnightOfToday)
        query.findObjectsInBackground {object, error in
            if object != nil {
                self.meals = object!
                self.tableView.reloadData()
                self.myRefreshControl.endRefreshing()
            } else {
                print(error.debugDescription)
            }
        }
    }
    
    @IBAction func onBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        meals.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let meal = meals[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell") as!
        MealCell
        
        let identifier = meal["identifier"] as! String
        var notes = ""
        
        if identifier != "Guest" {
            notes = meal["notes"] as!
            String
        }
        cell.guestName.text = "Guest: " + identifier
        
        cell.guestNotes.text = "Notes: " + notes
        
        let servedStay = meal["toStayMeals"] as! String
        let servedGo = meal["toGoMeals"] as! String
        
        cell.servedStay.text = "Meals Served to Stay: " + servedStay
        cell.servedGo.text = "Meals Served to Go: " + servedGo
        
        return cell
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */


    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

   
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return UITableView.automaticDimension
     }
    

}
