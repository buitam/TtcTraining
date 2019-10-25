//
//  DangNhapVC.swift
//  TTCTraining
//
//  Created by Apple on 10/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class DangNhapVC: UIViewController {


    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    @IBAction func btnLoginAction(_ sender: Any) {
        if(txtPassword.text == "123" && txtUserName.text == "Tam") {
            let scr = storyboard?.instantiateViewController(withIdentifier: "Main") as! ViewController
            present(scr, animated: true, completion: nil)
        } else {
            let alert: UIAlertController = UIAlertController(title: "Thông báo", message: "Tên đăng nhập hoặc mật khẩu không chính xác", preferredStyle: .alert)
            let btn_Ok: UIAlertAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
            alert.addAction(btn_Ok)
            present(alert, animated: true, completion: nil)
        }
    }



}
