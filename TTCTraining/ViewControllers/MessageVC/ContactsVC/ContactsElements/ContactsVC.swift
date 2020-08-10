//
//  BanBeViewController.swift
//  TTCTraining
//
//  Created by Apple on 10/31/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ContactsVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    var listInfo:[Info] = Info.initInfo()
    let initialDataAry:[Info] = Info.initInfo()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        searchBar.cornerRadius(10)
        let nib = UINib.init(nibName: "ContactTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "Cell")
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - search bar delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            listInfo = initialDataAry
            self.tableView.reloadData()
        }else {
            filterTableView(text: searchText)
        }
    }
    
    func filterTableView(text:String) {
        //fix of not searching when backspacing
        listInfo = initialDataAry.filter({ (mod) -> Bool in
            return mod.name!.lowercased().contains(text.lowercased())
        })
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listInfo.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ContactTableViewCell
        cell.configCell(listInfo[indexPath.row])
        return cell
    }
    
    
}





