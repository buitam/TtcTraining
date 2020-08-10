//
//  ContactTableViewCell.swift
//  TTCTraining
//
//  Created by Bui Tam on 8/9/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func configCell(_ data: Info){
        // config UI
        profileImg.cornerRadius(30)
        // Config Data
        profileImg.image = data.profileImg
        name.text = data.name
    }
    
}