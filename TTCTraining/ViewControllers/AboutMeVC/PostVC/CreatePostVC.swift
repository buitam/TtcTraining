//
//  CreatePostVC.swift
//  TTCTraining
//
//  Created by Bui Tam on 8/14/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class CreatePostVC: UIViewController {
    @IBAction func btnSelectPhoto(_ sender: Any) {
        presentPhotoActionSheet()
    }
    @IBOutlet weak var profileImage: UIImageView!
   
    @IBOutlet weak var currentName: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var contentPost: UITextView!
    @IBOutlet weak var constraintTopStackIcon: NSLayoutConstraint!
    @IBOutlet weak var btnPost: UIButton!
    @IBAction func btnBackAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnPostAction(_ sender: Any) {
        guard let image = self.postImage.image,
              let data = image.pngData() else {
            return
        }
        guard let email = UserDefaults.standard.value(forKey: "email") as? String else {
            return
        }
        let safeEmail = DatabaseManager.safeEmail(emailAddress: email)
        let filename = "\(safeEmail)_post.png"
        let folder = "postImages/"
        StorageManager.shared.uploadPicture(with: data, fileName: filename, folder: folder, completion: { result in
            switch result {
            case .success(let downloadUrl):
                UserDefaults.standard.set(downloadUrl, forKey: "post_picture_url")
                DatabaseManager.shared.createNewPost(contentPost: self.contentPost.text, postImage: downloadUrl, completion: {success in
                    if success {
                        print("created post")
                    }
                    else {
                        print("faield to post")
                        
                    }
                })
                print("post_picture_url: \(downloadUrl)")
            case .failure(let error):
                print("Storage maanger error: \(error)")
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
    
    func initUI() {
        contentPost.delegate = self
        hideKeyboard()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        currentName.text = UserDefaults.standard.value(forKey: "name") as? String
        setImageProfile(profileImage: profileImage)
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                constraintTopStackIcon.constant = 420 - keyboardSize.height
                self.view.frame.origin.y -= 0
            }
        }
    }
    func hideKeyboard() {
           let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismiasKeyBoard))
           tap.cancelsTouchesInView = false
           view.addGestureRecognizer(tap)
       }
       
       @objc func dismiasKeyBoard() {
        constraintTopStackIcon.constant = 400
           view.endEditing(true)
           if self.view.frame.origin.y != 0 {
               self.view.frame.origin.y = 0
           }
       }
    
}

extension CreatePostVC: UITextViewDelegate {
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
            btnPost.setTitleColor(BLUE_MAIN, for: .normal)
            return true
    }
}

extension CreatePostVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func presentPhotoActionSheet() {
        let actionSheet = UIAlertController(title: "Profile Picture",
                                            message: "How would you like to select a picture?",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel",
                                            style: .cancel,
                                            handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Take Photo",
                                            style: .default,
                                            handler: { [weak self] _ in
                                                
                                                self?.presentCamera()
                                                
                                            }))
        actionSheet.addAction(UIAlertAction(title: "Chose Photo",
                                            style: .default,
                                            handler: { [weak self] _ in
                                                
                                                self?.presentPhotoPicker()
                                            }))
        
        present(actionSheet, animated: true)
    }
    
    func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        
        self.postImage.image = selectedImage
        self.postImage.isHidden = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}

struct Post {
    public var id: String
    public var contentPost: String
    public var userPostName: String
    public var emailAddress: String
    public var comment: Comment
    public var postDate: Date
    var safeEmail: String {
        var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        return safeEmail
    }
    public var postImageName: String {
        return "\(safeEmail)_post.png"
    }
    public var userImageName: String {
        return "\(safeEmail)_profile_picture.png"
    }
}

struct Comment {
    public var userComment: String
    public var userCommentImage: String
    public var contentComment: String
}
