//
//  VacancyInfoTableViewCell.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 20/02/23.
//

import UIKit

class VacancyInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var myView: UIView!
    static var myId = "VacancyInfoTableViewCell"
    static var uinib = UINib(nibName: "VacancyInfoTableViewCell", bundle: nil)
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        // Initialization code
    }
    func setup(){
        myView.layer.cornerRadius = 12
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
