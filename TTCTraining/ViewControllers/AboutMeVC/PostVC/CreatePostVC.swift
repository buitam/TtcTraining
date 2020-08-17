//
//  CreatePostVC.swift
//  TTCTraining
//
//  Created by Bui Tam on 8/14/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class CreatePostVC: UIViewController {
    @IBOutlet weak var tfContentPost: UITextField!
    @IBOutlet weak var constraintTopStackIcon: NSLayoutConstraint!
    @IBOutlet weak var btnPost: UIButton!
    @IBAction func btnBackAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    func initUI() {
        tfContentPost.delegate = self
        hideKeyboard()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                constraintTopStackIcon.constant = 420 - keyboardSize.height
                self.view.frame.origin.y -= 0
            }
        }
    }
    func hideKeyboard() {
           let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismiasKeyBoard))
           tap.cancelsTouchesInView = false
           view.addGestureRecognizer(tap)
       }
       
       @objc func dismiasKeyBoard() {
        constraintTopStackIcon.constant = 400
           view.endEditing(true)
           if self.view.frame.origin.y != 0 {
               self.view.frame.origin.y = 0
           }
       }
    
}

extension CreatePostVC: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        btnPost.setTitleColor(BLUE_MAIN, for: .normal)
        return true
    }
}
