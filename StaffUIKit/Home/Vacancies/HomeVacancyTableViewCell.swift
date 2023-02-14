//
//  HomeVacancyTableViewCell.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 13/02/23.
//

import UIKit

class HomeVacancyTableViewCell: UITableViewCell {
    static var myId = "HomeVacancyTableViewCell"
    static var uinib = UINib(nibName: "HomeVacancyTableViewCell", bundle: nil)
    @IBOutlet weak var vacancyView: UIView!
    @IBOutlet weak var companyView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        // Initialization code
    }
    func setup(){
        vacancyView.layer.cornerRadius = 12
        companyView.layer.cornerRadius = 12
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
