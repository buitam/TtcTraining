//
//  EditProfileVC.swift
//  TTCTraining
//
//  Created by Bui Tam on 8/10/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class EditProfileVC: UIViewController {
    @IBOutlet weak var editProfileTableView: UITableView!
    var lstEditProfile = EditProfileMD.initEditProfile()
    @IBAction func btnBackAction(_ sender: Any) {
        createAnimated(self: self)
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBOutlet weak var editProfileTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var btnChangeImage: UIButton!
    @IBAction func btnChangeImgURLAction(_ sender: Any) {
    }
    
        override func viewDidLoad() {
            super.viewDidLoad()
            initUI()
            initData()
        }
        
        func initData(){
        }
        
        func initUI(){
            btnChangeImage.cornerRadius(70)
            editProfileTableView.delegate = self
            editProfileTableView.dataSource = self
            editProfileTableView.register(UINib(nibName: "EditProfileTBVCell", bundle: nil), forCellReuseIdentifier: "EditProfileTBVCell")
            editProfileTableViewHeight.constant = CGFloat(lstEditProfile.count * 50)
        }
    }

    // MARK: - TableViewDelegates and datasources
    extension EditProfileVC: UITableViewDelegate, UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return lstEditProfile.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = editProfileTableView.dequeueReusableCell(withIdentifier: "EditProfileTBVCell", for: indexPath) as? EditProfileTBVCell
            cell?.configCell(lstEditProfile[indexPath.row])
            return cell!
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 50
        }
    }
