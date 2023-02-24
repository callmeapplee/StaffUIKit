//
//  VacancyDetailHeaderTableViewCell.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 20/02/23.
//

import UIKit

class VacancyDetailHeaderTableViewCell: UITableViewCell {
    static var myId = "VacancyDetailHeaderTableViewCell"
    static var uinib = UINib(nibName: "VacancyDetailHeaderTableViewCell", bundle: nil)
    var vc = UIViewController()
    @IBOutlet weak var goBack: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func tappedGoBack(_ sender: Any) {
        vc.navigationController?.popViewController(animated: true)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
