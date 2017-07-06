//
//  ViewController.swift
//  Stretchy Snacks
//
//  Created by Alex Lee on 2017-07-06.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

import UIKit

// MARK: constants
struct constants {
    
    static let expandedHeight = CGFloat(floatLiteral: 200.0)
    
    static let contractedHeight = CGFloat(floatLiteral: 64.0)
    
    static let plusSignRotation = CGFloat(floatLiteral: Double.pi/4)
}

class ViewController: UIViewController {
    var isExpanded = false
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
        let sent = sender as! UIButton
        print("Plus icon pressed")
        if (isExpanded) {
            
            self.customNavBarHeight.constant = constants.contractedHeight
            
            sent.transform = CGAffineTransform(rotationAngle: constants.plusSignRotation * 2)
            
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: { (value: Bool) in
                self.isExpanded = !self.isExpanded
            })
            
        } else {
            
            self.customNavBarHeight.constant = constants.expandedHeight
            
            sent.transform = CGAffineTransform(rotationAngle: constants.plusSignRotation)
            
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: { (value: Bool) in
                self.isExpanded = !self.isExpanded
            })
            
        }
    }
    
}

