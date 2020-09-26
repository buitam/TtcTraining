//
//  AddFriendVC.swift
//  TTCTraining
//
//  Created by Bui Tam on 9/25/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
class FollowVC: UIViewController {

    private var follows = [Follow]()
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
        getAllFollowUser()

        // Do any additional setup after loading the view.
    }
    func getAllFollowUser() {
        DatabaseManager.shared.getAllUsers(completion: { [weak self] result in
            switch result {
            case .success(let usersCollection):
                self!.follows = usersCollection.compactMap({ dictionary in
                    guard let email = dictionary["email"],
                          let name = dictionary["name"]
                    else {
                        return nil
                    }
                    let userImageURL = "images/\(email)_profile_picture.png"
                    
                    
                    return Follow(image: userImageURL, name: name, userRecieveRequestEmail: email)
                })
                self!.tableView.reloadData()
               
            case .failure(let error):
                print("Failed to get usres: \(error)")
            }
        })
    }


}
extension FollowVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return follows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FollowTBV", for: indexPath) as! FollowTBV
        cell.followEmail = follows[indexPath.row].userRecieveRequestEmail
        cell.followName = follows[indexPath.row].name
        cell.configCell(follows[indexPath.row])
        return cell
    }


    
}

struct Follow {
     var image: String?
     var name: String?
    var userSendRequestEmail: String?
    var userRecieveRequestEmail: String?
    
}
