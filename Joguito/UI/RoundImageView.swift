//
//  RoundImageView.swift
//  Joguito
//
//  Created by Mohamed on 12/06/2018.
//  Copyright © 2018 Joguito. All rights reserved.
//

import UIKit

@IBDesignable
class RoundImageView: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        setup()
    }
    
    func setup() {
        self.layer.cornerRadius = self.frame.height / 2
    }

}
