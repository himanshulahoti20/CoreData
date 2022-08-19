//
//  Label Extensions.swift
//  CoreDataAssignment
//
//  Created by Himanshu Lahoti on 27/06/22.
//

import Foundation
import UIKit
class LabelProperties : UILabel {
    public var lblBorderColor : UIColor = UIColor.clear
    @IBInspectable public var borderColor : UIColor {
        set {
            layer.borderColor = newValue.cgColor
            lblBorderColor = newValue
        }
        get {
            return self.lblBorderColor
        }
    }
    
    public var lblBorderWidth : CGFloat = 0.0
    @IBInspectable public var borderWidth : CGFloat{
        set{
            layer.borderWidth = newValue
            lblBorderWidth = newValue
        }
        get {
            return self.lblBorderWidth
        }
    }
    public var lblCornerRadius : CGFloat = 0.0
    @IBInspectable public var cornerRadius : CGFloat{
        set{
            layer.borderWidth = newValue
            lblCornerRadius = newValue
        }
        get {
            return self.lblCornerRadius
        }
    }
}
