//
//  RegisterViewController.swift
//  CoreDataAssignment
//
//  Created by Himanshu Lahoti on 14/06/22.
//

import Foundation
import UIKit
import CoreData
class RegisterViewController : UIViewController{
    
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var dateOfBirth: UITextField!
    @IBOutlet weak var selectedImage: UIImageView!
    var imageUploaded = false
    let datePicker = DatePickerDialog()
    var newImage : UIImage?=nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateOfBirth.delegate = self

    }
    
    @IBAction func chooseButton(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker,animated: true)
    }
    
    @IBAction func SignUpPressed(_ sender: UIButton) {
        if !Utility.isValidTextField(textfield: name){
            Utility.showAlertBox(title: "Warning", message: "Please Enter Name", controller: self)
        } else if !Utility.isValidTextField(textfield: email){
            Utility.showAlertBox(title: "Warning", message: "Please Enter Email", controller: self)
        }else if !Utility.isValidEmail(email: email.text!){
            Utility.showAlertBox(title: "Warning", message: "Please Enter a valid email address", controller: self)
        }else if !Utility.isValidTextField(textfield: password){
            Utility.showAlertBox(title: "Warning", message: "Please Enter Password", controller: self)
        }else if !Utility.isValidPassword(password: password.text!){
            Utility.showAlertBox(title: "Password should have atleast 8 characters", message: "A uppercase letter,A lowercase letter,a number,a special character", controller: self)
        }else if !Utility.isValidTextField(textfield: dateOfBirth){
            Utility.showAlertBox(title: "Warning", message: "Please Enter Date of Birth", controller: self)
        }else if !imageUploaded {
            Utility.showAlertBox(title: "Warning", message: "Upload an Image", controller: self)
        }else {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            let predicate = NSPredicate(format: "email = %@", email.text! as String)
            let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserInformation")
            fetchrequest.predicate = predicate
            do {
                let results = try context.fetch(fetchrequest) as NSArray
                print(results.count)
                if results.count > 0 {
                    Utility.showAlertBox(title: "Alert!!", message: "User Already Exists!! Use other email address.", controller: self)
                } else {
                    let app = UIApplication.shared.delegate as! AppDelegate
                    let context = app.persistentContainer.viewContext
                    let new_user = NSEntityDescription.insertNewObject(forEntityName: "UserInformation", into: context) as! UserInformation
                    new_user.setValue(name.text, forKey: "name")
                    new_user.setValue(email.text, forKey: "email")
                    new_user.setValue(password.text, forKey: "password")
                    new_user.setValue(dateOfBirth.text, forKey: "dob")
                    new_user.image = newImage?.jpegData(compressionQuality: 1) as Data?
                    do
                    {
                        try context.save()
                        print("Registered  Sucessfully")
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                    catch
                    {
                        let Fetcherror = error as NSError
                        print("error", Fetcherror.localizedDescription)
                    }
                    self.navigationController?.popViewController(animated: true)
                }
            } catch{
                let error = error as NSError
                print("Catch for email already exits")
                print(error.localizedDescription)
            }
        }
    }
    func datePickerTapped() {
        let currentDate = Date()
        var dateComponents = DateComponents()
        dateComponents.month = -3
        let threeMonthAgo = Calendar.current.date(byAdding: dateComponents, to: currentDate)
        
        datePicker.show("DatePickerDialog",
                        doneButtonTitle: "Done",
                        cancelButtonTitle: "Cancel",
                        minimumDate: threeMonthAgo,
                        maximumDate: currentDate,
                        datePickerMode: .date) { (date) in
            if let dt = date {
                let formatter = DateFormatter()
                formatter.dateFormat = "dd/MM/yyyy"
                self.dateOfBirth.text = formatter.string(from: dt)
            }
        }
    }
}

extension RegisterViewController :  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageUploaded = true
            selectedImage.image = pickedImage
            newImage = selectedImage.image
        }
        dismiss(animated: true, completion: nil)
    }
}
extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == self.dateOfBirth {
            datePickerTapped()
            return false
        }
        return true
    }
}




