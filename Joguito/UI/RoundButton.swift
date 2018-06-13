//
//  RoundButton.swift
//  Joguito
//
//  Created by Mohamed on 12/06/2018.
//  Copyright © 2018 Joguito. All rights reserved.
//

import UIKit

@IBDesignable class RoundButton: UIButton {
    
    @IBInspectable var bgColor: UIColor = UIColor.blue {
        didSet {
            self.backgroundColor = bgColor
        }
    }
    
    @IBInspectable var radius: CGFloat = CGFloat(0) {
        didSet {
            self.layer.cornerRadius = radius
        }
    }
    
    //@IBInspectable var startColor: UIColor = UIColor.clear
    
    //@IBInspectable var endColor: UIColor = UIColor.clear
    
    @IBInspectable var useGradient: Bool = false {
        didSet {
            if useGradient == true {
                self.setGradientLayer(startColor: UIColor(red: 226/255, green: 226/255, blue: 7/255, alpha: 1.0), endColor: UIColor(red: 225/255, green: 182/255, blue: 0/255, alpha: 1.0))
                layer.masksToBounds = true
            } else {
                self.backgroundColor = bgColor
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        setup()
    }
    
    func setup() {
        self.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        self.imageEdgeInsets = UIEdgeInsetsMake(8, 0, 8, 8);
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.numberOfLines = 1
        //self.titleLabel?.lineBreakMode = NSLineBreakByClipping;
    }
    
}
