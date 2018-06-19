//
//  RoundButton.swift
//  Joguito
//
//  Created by Mohamed on 12/06/2018.
//  Copyright © 2018 Joguito. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    
    @IBInspectable var startColor: UIColor = UIColor.clear {
        didSet {
            updateGradient()
        }
    }
    
    @IBInspectable var endColor: UIColor = UIColor.clear {
        didSet {
            updateGradient()
        }
    }
    
    @IBInspectable var edgesColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = edgesColor.cgColor
        }
    }
    
    @IBInspectable var edgesThikness: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = edgesThikness
        }
    }
    
    @IBInspectable var useGradient: Bool = false {
        didSet {
            updateGradient()
        }
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        setup()
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    override func prepareForInterfaceBuilder() {
        setup()
    }
    
    fileprivate func updateGradient() {
        if self.useGradient != false {
            self.setGradientLayer(startColor: startColor, endColor: endColor)
            layer.masksToBounds = true
            layoutIfNeeded()
        } else {
            setup()
        }
    }
    
    func setup() {
        self.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        self.imageEdgeInsets = UIEdgeInsetsMake(8, 0, 8, 8);
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.numberOfLines = 1
        self.layer.cornerRadius = self.frame.height / 2
    }
    
}
