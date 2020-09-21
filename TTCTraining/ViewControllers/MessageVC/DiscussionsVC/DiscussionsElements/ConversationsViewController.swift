//
//  ConversationsViewController.swift
//  TTCTraining
//
//  Created by Bui Tam on 9/21/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import JGProgressHUD
final class ConversationsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let spinner = JGProgressHUD(style: .dark)
    
    private let noConversationsLabel: UILabel = {
        let label = UILabel()
        label.text = "No Conversations!"
        label.textAlignment = .center
        label.textColor = .gray
        label.font = .systemFont(ofSize: 21, weight: .medium)
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Discussion"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(didTapComposeButton))
        view.addSubview(noConversationsLabel)
        tableView.delegate = self
        tableView.dataSource = self
        fetchConversation()
        
    }
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
    @objc private func didTapComposeButton() {
        let vc = NewConversationViewController()
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
        
    }
    
    func fetchConversation() {
        tableView.isHidden = false
    }
}
extension ConversationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "hello world"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ChatContentVC()
        vc.title = "jon Smith"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
