//
//  IndicatorTableViewCell.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 16/02/23.
//

import UIKit

class IndicatorTableViewCell: UITableViewCell {
    static var myId = "IndicatorTableViewCell"
    static var uinib = UINib(nibName: "IndicatorTableViewCell", bundle: nil)
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
