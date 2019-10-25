//
//  LoginViewController.swift
//  TTCTraining
//
//  Created by Apple on 10/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
var views: [UIView]!

    @IBOutlet weak var viewContainer: UIView!
    @IBAction func segmentLogin(_ sender: UISegmentedControl) {
        viewContainer.bringSubviewToFront(views[sender.selectedSegmentIndex])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        views = [UIView]()
        views.append(DangNhapVC().view)
        views.append(DangKiVC().view)
        for v in views {
            viewContainer.addSubview(v)
        }
    viewContainer.bringSubviewToFront(views[0])
        // Do any additional setup after loading the view.
    }
    

    
}
