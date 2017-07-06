//
//  ViewController.swift
//  Stretchy Snacks
//
//  Created by Alex Lee on 2017-07-06.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customNavBar: UIView!
    @IBOutlet weak var navBarButton: UIButton!
    
    @IBOutlet weak var customNavBarHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func plusIconPressed(_ sender: Any) {
        print("Plus icon pressed")
        self.customNavBarHeight.constant = 200
        UIView.animate(withDuration: 0.8, animations: {
//            self.customNavBarHeight.constant = 200
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

}

