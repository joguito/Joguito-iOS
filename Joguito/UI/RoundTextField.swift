//
//  RoundTextField.swift
//  Joguito
//
//  Created by Mohamed on 12/06/2018.
//  Copyright © 2018 Joguito. All rights reserved.
//

import UIKit

@IBDesignable class RoundTextField: UITextField {
    
    @IBInspectable var edgeRadius: CGFloat = CGFloat(0) {
        didSet {
            self.layer.cornerRadius = edgeRadius
        }
    }
    
    @IBInspectable var backgroundOppacity: CGFloat = CGFloat(1) {
        didSet {
            self.backgroundColor = UIColor(white: 1, alpha: backgroundOppacity)
        }
    }
    
    @IBInspectable var edgesThikness: CGFloat = CGFloat(0) {
        didSet {
            self.layer.borderWidth = edgesThikness
        }
    }
    
    @IBInspectable var edgesColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = edgesColor.cgColor
        }
    }
    
    @IBInspectable var placeholderColor: UIColor = UIColor.black {
        didSet {
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedStringKey.foregroundColor : placeholderColor])
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
        
    }

}
