//
//  GradientView.swift
//  Joguito
//
//  Created by Mohamed on 12/06/2018.
//  Copyright © 2018 Joguito. All rights reserved.
//

import UIKit

@IBDesignable class GradientView: UIView {
    
    @IBInspectable var startColor: UIColor = UIColor.clear {
        didSet {
            setup()
        }
    }
    
    @IBInspectable var endColor: UIColor = UIColor.clear {
        didSet {
            setup()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        //setup()
    }
    
    override func prepareForInterfaceBuilder() {
        
    }
    
    override func layoutSubviews() {
        setup()
    }
    
    func setup() {
        self.setGradientLayer(startColor: startColor, endColor: endColor)
    }

}
