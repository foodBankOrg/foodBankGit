//
//  GuestViewController.swift
//  foodBank
//
//  Created by William McPhail on 4/15/22.
//

import UIKit

class GuestViewController: UIViewController {
    
    
    @IBOutlet weak var stayCountLabel: UILabel!
    @IBOutlet weak var goCountLabel: UILabel!
    
    @IBOutlet weak var minusButtonStay: UIButton!
    @IBOutlet weak var plusButtonStay: UIButton!
    
    @IBOutlet weak var minusButtonGo: UIButton!
    @IBOutlet weak var plusButtonGo: UIButton!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBAction func onMinusButtonStay(_ sender: Any) {
    }
    
    @IBAction func onPlusButtonStay(_ sender: Any) {
    }
    
    @IBAction func onMinusButtonGo(_ sender: Any) {
    }
    
    @IBAction func onPlusButtonGo(_ sender: Any) {
    }
    
    @IBAction func onBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func onSubmit(_ sender: Any) {
    }
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
