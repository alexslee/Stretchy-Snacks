//
//  ViewController.swift
//  Stretchy Snacks
//
//  Created by Alex Lee on 2017-07-06.
//  Copyright © 2017 Alex Lee. All rights reserved.
//

import UIKit

// MARK: Constants
struct Constants {
    
    static let expandedHeight = CGFloat(floatLiteral: 200.0)
    
    static let contractedHeight = CGFloat(floatLiteral: 64.0)
    
    static let plusSignRotation = CGFloat(floatLiteral: Double.pi/4)
    
    static let buttonWidthFactor = CGFloat(floatLiteral: 6.0)
}

// MARK: ViewController
class ViewController: UIViewController {
    
    // MARK: properties
    @IBOutlet weak var customNavBar: UIView!
    
    @IBOutlet weak var navBarButton: UIButton!
    
    @IBOutlet weak var customNavBarHeight: NSLayoutConstraint!
    
    var isExpanded = false
    var stackView = UIStackView()
    var stackSnacks: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        stackSnacks = [ #imageLiteral(resourceName: "oreos"),
                        #imageLiteral(resourceName: "pizza_pockets"),
                        #imageLiteral(resourceName: "pop_tarts"),
                        #imageLiteral(resourceName: "popsicle"),
                        #imageLiteral(resourceName: "ramen")
        ]
        stackView.isHidden = true
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 5.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        customNavBar.addSubview(stackView)
        
        stackView.bottomAnchor.constraint(equalTo: customNavBar.bottomAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: customNavBar.centerXAnchor).isActive = true
        
        for snack in stackSnacks {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(button)
            button.heightAnchor.constraint(equalToConstant: self.customNavBar.frame.size.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: (self.customNavBar.frame.size.width - self.navBarButton.frame.size.width) / Constants.buttonWidthFactor).isActive = true
            button.setImage(snack, for: .normal)
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func plusIconPressed(_ sender: Any) {
        let sent = sender as! UIButton
        print("Plus icon pressed")
        if (isExpanded) {
            
            self.customNavBarHeight.constant = Constants.contractedHeight
            
            sent.transform = CGAffineTransform(rotationAngle: Constants.plusSignRotation * 2)
            
            stackView.isHidden = true
            
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: { (value: Bool) in
                self.isExpanded = !self.isExpanded
            })
            
        } else {
            
            self.customNavBarHeight.constant = Constants.expandedHeight
            
            sent.transform = CGAffineTransform(rotationAngle: Constants.plusSignRotation)
            
            stackView.isHidden = false
            
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: { (value: Bool) in
                self.isExpanded = !self.isExpanded
            })
            
        }
    }
    
}

