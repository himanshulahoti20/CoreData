//
//  utility.swift
//  CoreDataAssignment
//
//  Created by Himanshu Lahoti on 23/06/22.
//

import Foundation
import UIKit
class Utility {
    class func showAlertBox(title: String, message: String, controller : UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
        
    }
    
    class func isValidTextField(textfield : UITextField) -> Bool {
        if textfield.text?.trimmingCharacters(in:CharacterSet.whitespacesAndNewlines).count == 0 {
            return false
        } else {
            return true
        }
    }
    
    class func isValidEmail(email : String ) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    class func isValidPassword(password : String) -> Bool {
        let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        return passwordCheck.evaluate(with: password)
    }
    
    class func isValidDate(date : String) -> Bool {
        let dateRegx = "^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\\d\\d$"
        let dateCheck = NSPredicate(format: "SELF MATCHES %@",dateRegx)
        return dateCheck.evaluate(with: date)
    }
    class func isValidImage(image : UIImageView) -> Bool {
        if image.image == nil{
            return true
        } else{
            return false
        }
    }
    
    
}
extension UIView {
        var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    
}
