//
//  SignUpVC.swift
//  TTCTraining
//
//  Created by Bui Tam on 8/16/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfConfirmPassword: UITextField!

    
    @IBAction func btnshowPassAction(_ sender: Any) {
         tfPassword.isSecureTextEntry.toggle()
    }
    
    @IBAction func btnConfirmPassAction(_ sender: Any) {
        tfConfirmPassword.isSecureTextEntry.toggle()

    }
    @IBAction func btnSignInAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= 130
            }
    }
    

}
