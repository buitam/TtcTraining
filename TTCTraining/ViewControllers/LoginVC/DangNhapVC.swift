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
    @IBOutlet weak var loginWithGoogle: UIButton!
    @IBOutlet weak var txtpassword: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    let userName = "tam"
    let pass = "1"
    override func viewDidLoad() {
        super.viewDidLoad()
        btnLogin.cornerRadius(5)
        loginWithGoogle.cornerRadius(5)
        // Do any additional setup after loading the view.
        
    }

    @IBAction func btnLoginAction(_ sender: Any){
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.setForegroundColor(.blue)
        SVProgressHUD.show()
        SVProgressHUD.dismiss(withDelay: 1.5) {
            if(self.txtpassword.text == self.userName && self.txtUserName.text == self.pass) {
                 let scr = self.storyboard?.instantiateViewController(withIdentifier: "Tabbar") as! TabbarViewController
                                self.navigationController?.pushViewController(scr, animated: true)
                                
                //                (scr, animated: true, completion: {
                //                    let popUp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopUp") as! PopUpViewController
                //                    popUp.ten = self.txtUserName.text!
                //                    popUp.password = self.txtpassword.text!
                //                    scr.addChild(popUp)
                //                    popUp.view.frame = scr.view.frame
                //                    scr.view.addSubview(popUp.view)
                //                    popUp.didMove(toParent: scr)
                //                })
                                
                            }
            else{
                AlertView(alertTitle: "Thất bại", sub: nil, alertMainText: "Sai tên tài khoản hoặc mật khẩu.", haveCancel: false, didAccept: nil, didCancel: nil).show()
            }
//                            else {
//                                let alert: UIAlertController = UIAlertController(title: "Thông báo", message: "Tên đăng nhập hoặc mật khẩu không chính xác", preferredStyle: .alert)
//                                let btn_Ok: UIAlertAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
//                                alert.addAction(btn_Ok)
//                                self.present(alert, animated: true, completion: nil)
//                            }
                        }

                    }

                }
