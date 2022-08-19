//
//  LoginViewController.swift
//  CoreDataAssignment
//
//  Created by Himanshu Lahoti on 14/06/22.
//

import Foundation
import UIKit
import CoreData
import TextFieldEffects
class SigninViewController : UIViewController,UITextFieldDelegate {
    
    var results = NSArray()
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if !Utility.isValidTextField(textfield: email){
            Utility.showAlertBox(title: "Warning", message: "Please Enter email", controller: self)
        }else if !Utility.isValidTextField(textfield: password){
            Utility.showAlertBox(title: "Warning", message: "Please Enter Password", controller: self)
        }else{
            self.CheckForUserNameAndPasswordMatch(email : email.text! as String, password : password.text! as String)
        }
    }
    
    func CheckForUserNameAndPasswordMatch( email: String, password : String)
    {
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserInformation")
        let predicate = NSPredicate(format: "email = %@", email)
        fetchrequest.predicate = predicate
        do
        {
            results = try context.fetch(fetchrequest) as NSArray
            if results.count > 0{
                let objectentity = results.firstObject as! UserInformation
                if objectentity.email == email && objectentity.password == password
                {
                    print("Login Succesfully")
                    self.performSegue(withIdentifier: "LoginSuccess", sender: self)
                } else {
                    Utility.showAlertBox(title: "Alert", message: "Wrong Email or Password", controller: self)
                    
                }
            }
        }catch{
            let fetch_error = error as NSError
            print("error", fetch_error.localizedDescription)
        }
    }
}
