//
//  SignUpVC.swift
//  TTCTraining
//
//  Created by Bui Tam on 8/16/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import FirebaseAuth
class SignUpVC: UIViewController {
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfConfirmPassword: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    
    @IBAction func btnshowPassAction(_ sender: Any) {
        tfPassword.isSecureTextEntry.toggle()
    }
    
    @IBAction func registerButton(_ sender: Any) {
        registerButtonTapped()
    }
    @IBAction func btnConfirmPassAction(_ sender: Any) {
        tfConfirmPassword.isSecureTextEntry.toggle()
        
    }
    @IBAction func btnSignInAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tfEmail.delegate = self
        tfUsername.delegate = self
        tfPassword.delegate = self
        tfConfirmPassword.delegate = self
        
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        imageView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self,
                                             action: #selector(didTapChangeProfilePic))
        imageView.addGestureRecognizer(gesture)
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.lightGray.cgColor
    }
    @objc private func didTapChangeProfilePic() {
        presentPhotoActionSheet()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= 130
        }
    }
    func registerButtonTapped() {
        tfUsername.resignFirstResponder()
        tfEmail.resignFirstResponder()
        tfPassword.resignFirstResponder()
        tfConfirmPassword.resignFirstResponder()
        tfPassword.autocorrectionType = .no
        tfConfirmPassword.autocorrectionType = .no
        guard let userName = tfUsername.text,
            let password = tfPassword.text,
            let email = tfEmail.text,
            let cfpassword = tfConfirmPassword.text,
            !userName.isEmpty,
            !password.isEmpty,
            !email.isEmpty,
            !cfpassword.isEmpty
            else {
                alertError()
                return
        }
        // Fire base create user accouunt
        DatabaseManager.shared.userExists(with: email, completion: {[weak self] exist in
            guard let strongSelf = self else {
                return
            }
            guard !exist else {
                strongSelf.alertError(message: "A user account for that email already exists!")
                return
            }
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: { authResult, error in
                
                // [START_EXCLUDE]
                guard authResult != nil, error == nil else {
                    print("error creating user")
                    return
                }
                
                strongSelf.navigationController?.dismiss(animated: true, completion: nil)
                
                DatabaseManager.shared.insertUser(with: ChatAppUser(userName: userName, emailAddress: email))
                
            })
            
        })
        
    }
    
    
    
    
}

extension SignUpVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == tfUsername {
            tfEmail.becomeFirstResponder()
        }
        else if textField == tfEmail {
            tfPassword.becomeFirstResponder()
        }
        else if textField == tfPassword {
            tfConfirmPassword.becomeFirstResponder()
        }
        else if textField == tfConfirmPassword {
            registerButtonTapped()
        }
        
        return true
    }
    
}
extension SignUpVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
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
        
        self.imageView.image = selectedImage
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}


