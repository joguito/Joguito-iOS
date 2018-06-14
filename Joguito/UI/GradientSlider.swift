//
//  GradientSlider.swift
//  Joguito
//
//  Created by Mohamed on 13/06/2018.
//  Copyright © 2018 Joguito. All rights reserved.
//

import UIKit

@IBDesignable
class GradientSlider: UISlider {
    
    @IBInspectable var thickness: CGFloat = 40
    
    let color1 = UIColor(red: 226/255, green: 226/255, blue: 7/255, alpha: 1.0)
    let color2 = UIColor(red: 225/255, green: 182/255, blue: 0/255, alpha: 1.0)
    
    func setup() {
        self.minimumTrackTintColor = colorWithGradient(frame: self.trackRect(forBounds: layer.bounds), colors: [color1, color1])
        self.maximumTrackTintColor = UIColor.darkGray
        self.clipsToBounds = true
    }
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        let defaultBounds = super.trackRect(forBounds: bounds)
        return CGRect(
            x: defaultBounds.origin.x,
            y: defaultBounds.origin.y + defaultBounds.size.height/2 - thickness/2,
            width: defaultBounds.size.width,
            height: thickness
        )
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        setup()
    }
    
    func colorWithGradient(frame: CGRect, colors: [UIColor]) -> UIColor {
        
        // create the background layer that will hold the gradient
        let backgroundGradientLayer = CAGradientLayer()
        backgroundGradientLayer.frame = frame
        
        backgroundGradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        backgroundGradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        backgroundGradientLayer.locations = [0.0,1.0]
        
        // we create an array of CG colors from out UIColor array
        let cgColors = colors.map({$0.cgColor})
        
        backgroundGradientLayer.colors = cgColors
//        backgroundGradientLayer.locations = [0.0, 0.5]
//        backgroundGradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
//        backgroundGradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        UIGraphicsBeginImageContext(backgroundGradientLayer.bounds.size)
        backgroundGradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return UIColor(patternImage: backgroundColorImage!)
    }

}
