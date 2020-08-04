//
//  LoginViewController.swift
//  TTCTraining
//
//  Created by Apple on 10/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
 
        @IBOutlet weak var topConstraintHeight: NSLayoutConstraint!
       
        @IBOutlet weak var logoTopConstraint: NSLayoutConstraint!

        @IBOutlet weak var topTravelMatesConstraint: NSLayoutConstraint!
        @IBAction func hideSigInPop(_ sender: Any) {
            topConstraintHeight.constant = 1000
            logoTopConstraint.constant = 252
            topTravelMatesConstraint.constant = 446
                        lblTravelMates.font = UIFont(name:"Noteworthy", size: 35.0)
            lblWelcome.isHidden = false
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseOut, animations:{ self.view.layoutIfNeeded()}, completion: nil)
            print("clicked")
        }
        @IBOutlet weak var lblWelcome: UILabel!
        @IBOutlet weak var lblTravelMates: UILabel!
        @IBAction func showLoginPop(_ sender: Any) {
            topConstraintHeight.constant = 180
            logoTopConstraint.constant = 50
            topTravelMatesConstraint.constant = 175
      
            lblTravelMates.font = UIFont(name:"Noteworthy", size: 25.0)
           
            lblWelcome.isHidden = true
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseOut, animations:{ self.view.layoutIfNeeded()}, completion: nil)
            print("clicked")
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            topConstraintHeight.constant = 1000
            logoTopConstraint.constant = 252
            topTravelMatesConstraint.constant = 446
            
            lblWelcome.isHidden = false
                lblTravelMates.font = UIFont(name:"Noteworthy", size: 35.0)
            // Do any additional setup after loading the view.
        }


    }

