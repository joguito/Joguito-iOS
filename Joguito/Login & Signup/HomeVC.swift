//
//  ViewController.swift
//  Joguito
//
//  Created by Mohamed on 11/06/2018.
//  Copyright © 2018 Joguito. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var signInBtn: RoundButton!
    
    let startColor = UIColor(red: 226/255, green: 226/255, blue: 7/255, alpha: 1.0)
    let endColor = UIColor(red: 225/255, green: 182/255, blue: 0/255, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLayoutSubviews() {
        signInBtn.setGradientLayer(startColor: startColor, endColor: endColor)
    }

}

