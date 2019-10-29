//
//  DangNhapVC.swift
//  TTCTraining
//
//  Created by Apple on 10/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import SVProgressHUD
class DangNhapVC: UIViewController {


    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func btnLoginAction(_ sender: Any){
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.setForegroundColor(.blue)
        SVProgressHUD.show()
        SVProgressHUD.dismiss(withDelay: 1.5) {
            if(self.txtpassword.text == "123" && self.txtUserName.text == "Tam") {
                let scr = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! ViewController
                self.present(scr, animated: true, completion: nil)
            } else {
                let alert: UIAlertController = UIAlertController(title: "Thông báo", message: "Tên đăng nhập hoặc mật khẩu không chính xác", preferredStyle: .alert)
                let btn_Ok: UIAlertAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
                alert.addAction(btn_Ok)
                self.present(alert, animated: true, completion: nil)
            }
        }

    }

}
