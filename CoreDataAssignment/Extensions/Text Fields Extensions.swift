//
//  Text Fields Extensions.swift
//  CoreDataAssignment
//
//  Created by Himanshu Lahoti on 27/06/22.
//

import Foundation
import UIKit
class TextFieldProperties : UITextField {
    public var textBorderColor : UIColor = UIColor.clear
    @IBInspectable public var borderColor : UIColor {
        set {
            layer.borderColor = newValue.cgColor
            textBorderColor = newValue
        }
        get {
            return self.textBorderColor
        }
    }
    
    public var textBorderWidth : CGFloat = 0.0
    @IBInspectable public var borderWidth : CGFloat{
        set {
            layer.borderWidth = newValue
            textBorderWidth = newValue
        }
        get {
            return self.textBorderWidth
        }
    }
    
    public var textCornerRadius : CGFloat = 0.0
    @IBInspectable public var cornerRadius : CGFloat{
        set {
            layer.cornerRadius = newValue
            textCornerRadius = newValue
        }
        get {
            return self.textCornerRadius
        }
    }
}
