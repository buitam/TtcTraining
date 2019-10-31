//
//  PopUpViewController.swift
//  TTCTraining
//
//  Created by Apple on 10/31/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    var ten:String = ""
    var password:String = ""
    @IBOutlet weak var lblTenDangNhap: UILabel!
    @IBOutlet weak var lblMatKhau: UILabel!
    @IBOutlet weak var btnClose: UIButton!
    @IBAction func btnClose(_ sender: Any) {
        self.removeAnimate()
    }
    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnClose.cornerRadius(5)
        contentView.cornerRadius(10)
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        lblTenDangNhap.text = ten
        lblMatKhau.text = password
        
    }
    
    func removeAnimate() {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 0.0
        }) { (finished: Bool) in
            if finished {
                self.view.removeFromSuperview()
            }
        }
    }

}
