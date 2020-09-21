//
//  TestViewController.swift
//  TTCTraining
//
//  Created by Bui Tam on 9/21/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib.init(nibName: "Cell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
    }
    
    
}

extension TestViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
}
