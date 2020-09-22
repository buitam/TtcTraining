//
//  PostedTBVCell.swift
//  TTCTraining
//
//  Created by Bui Tam on 8/14/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class PostedTBVCell: UITableViewCell {

    @IBOutlet weak var currentName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setImageProfile(profileImage: profileImage)
        currentName.text = UserDefaults.standard.value(forKey: "name") as? String
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var btnCheckIn: UIButton!
    @IBOutlet weak var contentPost: UILabel!
    @IBOutlet weak var imgPost: UIImageView!
    
    func configCell(_ data: PostedMD){
        btnCheckIn.setTitle(data.placeCheckIn.value(), for: .normal)
        contentPost.text = data.contentPost.value()
        imgPost.image = UIImage(named: data.imgPost!)
    }
    
    
}
