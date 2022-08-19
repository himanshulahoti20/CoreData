//
//  FinalViewController.swift
//  CoreDataAssignment
//
//  Created by Himanshu Lahoti on 14/06/22.
//

import Foundation
import UIKit
import CLTypingLabel
class FinalViewController : UIViewController {
    
    
    @IBOutlet weak var welcomeLabel: CLTypingLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        welcomeLabel.text = "Hello There !!"
    }
    
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        navigationController?.popToRootViewController(animated: true)
    }
}
