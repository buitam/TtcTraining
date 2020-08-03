//
//  LoginViewController.swift
//  TTCTraining
//
//  Created by Apple on 10/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var controller: LoginPageView?
    static var index:Int = 0
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller = storyboard!.instantiateViewController(withIdentifier: "LoginPageView") as! LoginPageView
        addChild(controller!)
        contentView.addSubview(controller!.view)
        controller!.didMove(toParent: self)
    }
    
    @IBAction func btnCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segment(_ sender: Any) {
        controller?.didChangePage(segmentControl.selectedSegmentIndex)
    }
}
