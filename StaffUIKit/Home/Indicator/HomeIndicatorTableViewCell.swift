//
//  HomeIndicatorTableViewCell.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 16/02/23.
//

import UIKit

class HomeIndicatorTableViewCell: UITableViewCell {
    static var myId = "HomeIndicatorTableViewCell"
    static var uinib = UINib(nibName: "HomeIndicatorTableViewCell", bundle: nil)
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
