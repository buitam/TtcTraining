//
//  SettingVC.swift
//  TTCTraining
//
//  Created by Bui Tam on 8/10/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {
    var lstSetting = SettingMD.initSetting()
    var lstTitleSection = ["ACCOUNT", "GENERAL","SUPPORT","ABOUT"]
    @IBOutlet weak var settingTableView: UITableView!
    @IBAction func btnBackAction(_ sender: Any) {
        createAnimated(self: self)
        self.dismiss(animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initData()
    }
    
    func initData(){
    }
    
    func initUI(){
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.register(UINib(nibName: "SettingTBVCell", bundle: nil), forCellReuseIdentifier: "SettingTBVCell")
    }
}

// MARK: - TableViewDelegates and datasources
extension SettingVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return lstSetting.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return lstTitleSection[section]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lstSetting[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingTableView.dequeueReusableCell(withIdentifier: "SettingTBVCell", for: indexPath) as? SettingTBVCell
        cell?.configCell(lstSetting[indexPath.section][indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
