//
//  Button Extensions.swift
//  CoreDataAssignment
//
//  Created by Himanshu Lahoti on 27/06/22.
//

import Foundation
import UIKit
class ButtonProperties : UIButton {
    public var btnBorderColor : UIColor = UIColor.clear
    @IBInspectable public var borderColor : UIColor {
        set {
            layer.borderColor = newValue.cgColor
            btnBorderColor = newValue
        }
        get {
            return self.btnBorderColor
        }
    }
    
    public var btnBorderWidth : CGFloat = 0.0
    @IBInspectable public var borderWidth : CGFloat{
        set{
            layer.borderWidth = newValue
            btnBorderWidth = newValue
        }
        get {
            return self.btnBorderWidth
        }
    }
    public var btnCornerRadius : CGFloat = 0.0
    @IBInspectable public var cornerRadius : CGFloat{
        set{
            layer.borderWidth = newValue
            btnCornerRadius = newValue
        }
        get {
            return self.btnCornerRadius
        }
    }
}
