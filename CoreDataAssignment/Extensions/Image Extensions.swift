//
//  Extensions.swift
//  CoreDataAssignment
//
//  Created by Himanshu Lahoti on 24/06/22.
//

import Foundation
import UIKit
class ImageProperties : UIImageView{
    public var imgBorderWidth : CGFloat = 0.0
    @IBInspectable public var borderWidth : CGFloat {
        set {
            layer.borderWidth = newValue
            imgBorderWidth = newValue
        }
        get {
            return self.imgBorderWidth
        }
    }
    
    public var imgCornerRadius : CGFloat = 0.0
    @IBInspectable public var cornerRadius : CGFloat {
        set {
            layer.cornerRadius = newValue
            imgCornerRadius = newValue
        }
        get {
            return self.imgCornerRadius
        }
    }
    
    public var imgBorderColor : UIColor = UIColor.clear
    @IBInspectable public var borderColor : UIColor {
        set {
            layer.borderColor = newValue.cgColor
            imgBorderColor = newValue
        }
        get {
            return self.imgBorderColor
        }
    }
}

extension UIImageView {
    func applyBlurEffect() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }
}





