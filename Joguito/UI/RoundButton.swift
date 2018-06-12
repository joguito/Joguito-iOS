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
                let gradientLayer:CAGradientLayer = CAGradientLayer()
                //e2e207 : 226 226 7
                //let startColor = UIColor(red: 226, green: 226, blue: 7, alpha: 1)
                
                //ffb600 : 225 182 0
                let endColor = UIColor(red: 225, green: 182, blue: 0, alpha: 1)
                gradientLayer.frame.size = self.frame.size
                gradientLayer.colors =
                    [UIColor.white.withAlphaComponent(0.1).cgColor, endColor.withAlphaComponent(1).cgColor]
                //Use diffrent colors
                gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
                gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
                gradientLayer.cornerRadius = radius
                self.layer.addSublayer(gradientLayer)
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
