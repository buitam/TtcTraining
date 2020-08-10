//
//  AboutMeViewController.swift
//  TTCTraining
//
//  Created by Bui Tam on 8/9/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class AboutMeViewController: UIViewController {
    @IBAction func btnEditProfileAction(_ sender: Any) {
        let editProfileVC = EditProfileVC(nibName: "EditProfileVC", bundle: nil)
        editProfileVC.modalPresentationStyle = .fullScreen
        createAnimated(self: self)
        self.present(editProfileVC, animated: false, completion: nil)
    }
    @IBAction func btnSettingAction(_ sender: Any) {
        let settingVC = SettingVC(nibName: "SettingVC", bundle: nil)
        settingVC.modalPresentationStyle = .fullScreen
        createAnimated(self: self)
        self.present(settingVC, animated: false, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
     

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
