//
//  DiscussionsTableViewCell.swift
//  TTCTraining
//
//  Created by Bui Tam on 8/9/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import SDWebImage
class DiscussionsTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userMessageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func configure(with model: Conversation) {
        userMessageLabel.text = model.latestMessage.text
        userNameLabel.text = model.name

        let path = "images/\(model.otherUserEmail)_profile_picture.png"
        StorageManager.shared.downloadURL(for: path, completion: { [weak self] result in
            switch result {
            case .success(let url):
                // this is an UI operation so need put on main thread
                DispatchQueue.main.async {
                    self?.userImageView.sd_setImage(with: url, completed: nil)
                }

            case .failure(let error):
                print("failed to get image url: \(error)")
            }
        })
    }

    
}
