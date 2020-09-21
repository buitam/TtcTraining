//
//  DiscussionsTableViewCell.swift
//  TTCTraining
//
//  Created by Bui Tam on 8/9/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class DiscussionsTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var newMesage: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    func configCell(with model: SearchResult) {
//        name.text = model.name
//
//        let path = "images/\(model.email)_profile_picture.png"
//        StorageManager.shared.downloadURL(for: path, completion: { [weak self] result in
//            switch result {
//            case .success(let url):
//
//                DispatchQueue.main.async {
//                    self?.profileImg.sd_setImage(with: url, completed: nil)
//                }
//
//            case .failure(let error):
//                print("failed to get image url: \(error)")
//            }
//        })
//        newMesage.text = model.name
//    }
    func configCell(_ data: Info){
        // config UI
        // Config Data
        profileImg.image = data.profileImg
        name.text = data.name
    }
    
}
