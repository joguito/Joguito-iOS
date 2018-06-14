//
//  SelectSkills.swift
//  Joguito
//
//  Created by Mohamed on 14/06/2018.
//  Copyright © 2018 Joguito. All rights reserved.
//

import UIKit

class SelectPositionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        view.setGradientLayer(startColor: Palette.Firefly, endColor: Palette.BigStone)
    }
    
}
