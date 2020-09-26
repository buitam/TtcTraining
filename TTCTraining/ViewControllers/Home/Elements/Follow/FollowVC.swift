//
//  AddFriendVC.swift
//  TTCTraining
//
//  Created by Bui Tam on 9/25/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class FollowVC: UIViewController {
   
    @IBAction func btnBackAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let cell = UINib.init(nibName: "FollowTBV", bundle: nil)
        self.tableView.register(cell, forCellReuseIdentifier: "FollowTBV")
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }


}
extension FollowVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FollowTBV", for: indexPath) as! FollowTBV
        return cell
    }

    
}

