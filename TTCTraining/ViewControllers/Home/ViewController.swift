//
//  ViewController.swift
//  TTCTraining
//
//  Created by Apple on 10/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import FirebaseAuth
import CenteredCollectionView
class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    var lstPost = PostedMD.initPost()
    @IBOutlet weak var userName: UILabel!
    private var posts = [PostModel]()

    @IBOutlet weak var imgProfile: UIImageView!
    let cellPercentWidth: CGFloat = 0.8
    
    // A reference to the `CenteredCollectionViewFlowLayout`.
    // Must be aquired from the IBOutlet collectionView.
    var centeredCollectionViewFlowLayout: CenteredCollectionViewFlowLayout!
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var addFriendCollectionView: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    var listInfo:[Info] = [];
    @IBOutlet weak var tableHeightLayout: NSLayoutConstraint!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var viewHeightLayout: NSLayoutConstraint!
    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        self.tableHeightLayout?.constant = self.tableView.contentSize.height
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewWillLayoutSubviews()
    }
    
    @IBAction func followActionBtn(_ sender: Any) {
        let vc = FollowVC(nibName: "FollowVC", bundle: nil)
        vc.fromController = "Home_SeeAll"
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func matchActionBtn(_ sender: Any) {
        let vc = MatchVC(nibName: "MatchVC", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.text = UserDefaults.standard.value(forKey: "name") as? String
        setImageProfile(profileImage: imgProfile)
        headerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapIntoHeaderView)))
        headerView.layer.cornerRadius = 10

        // border
        headerView.layer.borderWidth = 1.0
        headerView.layer.borderColor = UIColor.lightGray.cgColor

        // shadow
        headerView.layer.shadowColor = UIColor.black.cgColor
        headerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        headerView.layer.shadowOpacity = 0.3
        headerView.layer.shadowRadius = 4.0
        collectionView.delegate = self
        addFriendCollectionView.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.dataSource = self
        addFriendCollectionView.dataSource = self
     

        self.tableView.reloadData()
        self.tableView.layoutIfNeeded()
            
        listInfo = Info.initInfo()
        let nib = UINib.init(nibName: "BannerCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        
        let nibAddFriend = UINib.init(nibName: "AddFriendCollectionViewCell", bundle: nil)
        self.addFriendCollectionView.register(nibAddFriend, forCellWithReuseIdentifier: "Cell")
        
        let nibHomeTableView = UINib.init(nibName: "PostedTBVCell", bundle: nil)
        self.tableView.register(nibHomeTableView, forCellReuseIdentifier: "Cell")
       
        
        centeredCollectionViewFlowLayout = collectionView.collectionViewLayout as? CenteredCollectionViewFlowLayout
        
        // Modify the collectionView's decelerationRate (REQUIRED STEP)
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        
        // Assign delegate and data source
        collectionView.delegate = self
        collectionView.dataSource = self
        startListenningForPost()
        
        // Configure the required item size (REQUIRED STEP)
        centeredCollectionViewFlowLayout.itemSize = CGSize(
            width: 350,
            height: 250
        )
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        validateAuth()
    }

    @IBAction func btnPostLogin(_ sender: Any) {
        didTapIntoHeaderView()
    }
    @objc func didTapIntoHeaderView() {
        let createPostVC = CreatePostVC(nibName: "CreatePostVC", bundle: nil)
        createPostVC.modalPresentationStyle = .fullScreen
        self.present(createPostVC, animated: true, completion: nil)
    }
    private func validateAuth() {
        if FirebaseAuth.Auth.auth().currentUser == nil {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginVC = storyboard.instantiateViewController(withIdentifier: "Login") as! LoginViewController
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }
    
    
    //Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listInfo.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! BannerCollectionViewCell
            cell.configCell(listInfo[indexPath.row])
            return cell
        }
            
        else {
            let cellAddFriend = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! AddFriendCollectionViewCell
            cellAddFriend.configCell(listInfo[indexPath.row])
            return cellAddFriend
        }
    }
    
    //Table View
    private func startListenningForPost (){
        guard let email = UserDefaults.standard.value(forKey: "email") as? String else {
            return
        }
        let safeEmail = DatabaseManager.safeEmail(emailAddress: email)
        DatabaseManager.shared.getAllPosts(with: safeEmail, completion: {[weak self] result in
            switch result {
            case .success(let posts):
                guard !posts.isEmpty else {
                    return
                }
                print("post 2: \(posts)")
                DispatchQueue.main.async {
                    self?.posts = posts
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("fail to get post:\(error)")
            }
        })
    }
}


// MARK: - TableViewDelegates and datasources
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Total post: \(posts.count)")
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PostedTBVCell
        cell.configCell(posts[indexPath.row])
        print("Cell for row: \(posts[indexPath.row])")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
}
