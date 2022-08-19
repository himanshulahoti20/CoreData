//
//  ViewController.swift
//  CoreDataAssignment
//
//  Created by Himanshu Lahoti on 14/06/22.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    
    @IBOutlet weak var welcomeText: CLTypingLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeText.text = "Chat App!"
    }
    
    
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        let viewController = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        self.navigationController?.popToViewController(viewController, animated: true)
//        self.performSegue(withIdentifier: "ToSignUp", sender: self)
    }
    

}

