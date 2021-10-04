//
//  ViewController.swift
//  UNIchoice
//
//  Created by Mac on 29.04.17.
//  Copyright © 2017 AMD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var button: UIButton!

    @IBAction func buttonPressed(_ sender: Any) {
        button.setTitle("My button", for: UIControlState.normal)
        buttonWidth.constant = 300
        button.layoutIfNeeded()

    }

}

