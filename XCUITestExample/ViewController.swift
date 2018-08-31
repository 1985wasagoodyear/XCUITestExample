//
//  ViewController.swift
//  XCUITestExample
//
//  Created by Kevin Yu on 8/31/18.
//  Copyright © 2018 Kevin Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonAction(_ sender: Any) {
        self.label.text = "Fennel"
    }
    
}

