//
//  LoginViewController.swift
//  TTCTraining
//
//  Created by Apple on 10/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Alamofire
class LoginViewController: UIViewController {
    
    @IBOutlet weak var topConstraintHeight: NSLayoutConstraint!
    
    @IBOutlet weak var logoTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var tfPassword: UITextField!
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var topTravelMatesConstraint: NSLayoutConstraint!
    @IBAction func btnShowPasswordAction(_ sender: Any) {
        tfPassword.isSecureTextEntry.toggle()
    }
    @IBAction func hideSigInPop(_ sender: Any) {
        topConstraintHeight.constant = 1000
        logoTopConstraint.constant = 252
        topTravelMatesConstraint.constant = 446
        lblTravelMates.font = UIFont(name:"Noteworthy", size: 45.0)
        lblWelcome.isHidden = false
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseOut, animations:{ self.view.layoutIfNeeded()}, completion: { (_) in
            MGConnection.request(APIRouter.login(email: self.tfEmail.text!, password: self.tfPassword.text!), LoginResponse.self,completion: {(result, err) in
                guard err == nil else {
                    print("False with code: \(String(describing: err?.mErrorCode)) and message: \(String(describing: err?.mErrorMessage))")
                    return
                }
                if (self.tfEmail.text! == result?.user?.email && self.tfPassword.text! == result?.user?.fullname) {
                    let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "Tabbar") as! TabbarViewController
                    homeVC.modalPresentationStyle = .fullScreen
                    self.present(homeVC, animated: true, completion: nil)
                    
                }
                if (self.tfEmail.text! == "" || self.tfPassword.text! == "") {
                    let alert: UIAlertController = UIAlertController(title: "Thông báo", message: "Vui lòng nhập đầy đủ thông tin", preferredStyle: .alert)
                    let btn_Ok: UIAlertAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
                    alert.addAction(btn_Ok)
                    self.present(alert, animated: true, completion: nil)
                } else{
                    let alert: UIAlertController = UIAlertController(title: "Thông báo", message: "Tên đăng nhập hoặc mật khẩu không chính xác", preferredStyle: .alert)
                    let btn_Ok: UIAlertAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
                    alert.addAction(btn_Ok)
                    self.present(alert, animated: true, completion: nil)
                }
                
                
            })
            
        })
        
        
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
        lblTravelMates.font = UIFont(name:"Noteworthy", size: 45.0)
        // Do any additional setup after loading the view.
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= 50
    
        }
    }

    
    @IBAction func btnSignUpAction(_ sender: Any) {
        let signUpVC = SignUpVC(nibName: "SignUpVC", bundle: nil)
        signUpVC.modalPresentationStyle = .fullScreen
        self.present(signUpVC, animated: true, completion: nil)
        
    }
    
}

