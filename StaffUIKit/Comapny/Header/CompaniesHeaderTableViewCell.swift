//
//  CompaniesHeaderTableViewCell.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 17/02/23.
//

import UIKit

class CompaniesHeaderTableViewCell: UITableViewCell {
    static var myId = "CompaniesHeaderTableViewCell"
    static var uinib = UINib(nibName: "CompaniesHeaderTableViewCell", bundle: nil)
    @IBOutlet weak var notificationCount: UIButton!
    @IBOutlet weak var notification: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup(){
        notificationCount.layer.cornerRadius = notificationCount.frame.width / 2
        notification.layer.cornerRadius = 8
    }
}
