//
//  HomeHeaderTableViewCell.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 13/02/23.
//

import UIKit

class HomeHeaderTableViewCell: UITableViewCell {
    static var myId = "HomeHeaderTableViewCell"
    static var uinib = UINib(nibName: "HomeHeaderTableViewCell", bundle: nil)
    @IBOutlet weak var profileImage: UIButton!
    @IBOutlet weak var notificationCount: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        // Initialization code
    }
    func setup(){
        profileImage.layer.masksToBounds = true
        notificationCount.layer.cornerRadius = notificationCount.frame.width / 2
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = UIColor(red: 0.892, green: 0.892, blue: 0.892, alpha: 1).cgColor
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
