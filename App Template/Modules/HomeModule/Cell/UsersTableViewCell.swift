//
//  UsersTableViewCell.swift
//  App Template
//
//  Created by AliFayed on 08/10/2022.
//

import UIKit
import Kingfisher
class UsersTableViewCell: UITableViewCell {
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userAvatar: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setData(data: User) {
        userName.text = data.userName
        userAvatar.kf.setImage(with: URL(string: data.userAvatar), placeholder: nil, options: [.transition(.fade(0.7))])
        userAvatar.contentMode = .scaleAspectFill
        userAvatar.layer.masksToBounds = false
        userAvatar.layer.cornerRadius = (userAvatar.frame.height)/2
        userAvatar.clipsToBounds = true
    }
    
}
