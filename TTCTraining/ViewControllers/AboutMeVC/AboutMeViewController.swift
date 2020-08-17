//
//  AboutMeViewController.swift
//  TTCTraining
//
//  Created by Bui Tam on 8/9/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class AboutMeViewController: UIViewController {
    var lstPost = PostedMD.initPost()
    @IBOutlet weak var postedTableView: UITableView!
    @IBOutlet weak var postTableViewHeight: NSLayoutConstraint!
    @IBAction func btnBackAction(_ sender: Any) {
        createAnimated(self: self)
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func createPostGestureAction(_ sender: Any) {
        let createPostVC = CreatePostVC(nibName: "CreatePostVC", bundle: nil)
        createPostVC.modalPresentationStyle = .fullScreen
        self.present(createPostVC, animated: true, completion: nil)
    }
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
        initUI()
        initData()
    }
    
    func initData(){
    }
    
    func initUI(){
        postedTableView.delegate = self
        postedTableView.dataSource = self
        postedTableView.register(UINib(nibName: "PostedTBVCell", bundle: nil), forCellReuseIdentifier: "PostedTBVCell")
        postTableViewHeight.constant = CGFloat(lstPost.count * 500)
    }
}

// MARK: - TableViewDelegates and datasources
extension AboutMeViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lstPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postedTableView.dequeueReusableCell(withIdentifier: "PostedTBVCell", for: indexPath) as? PostedTBVCell
        cell?.configCell(lstPost[indexPath.row])
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
}
