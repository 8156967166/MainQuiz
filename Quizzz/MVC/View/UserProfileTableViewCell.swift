//
//  UserProfileTableViewCell.swift
//  Quizzz
//
//  Created by Bimal@AppStation on 22/06/22.
//

import UIKit

class UserProfileTableViewCell: UITableViewCell {
        @IBOutlet weak var labelName: UILabel?
        @IBOutlet weak var labelEmailTitle: UILabel?
        
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
        }
        func nameSet(setModelName: UserProfile) {
            self.labelName?.text = setModelName.setName
        }
        func UserProfile(setUserProfileModels: UserProfile) {
            self.labelEmailTitle?.text = setUserProfileModels.setEmail
        }

}
