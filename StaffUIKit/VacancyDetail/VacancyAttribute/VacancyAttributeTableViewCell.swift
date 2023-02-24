//
//  VacancyAttributeTableViewCell.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 20/02/23.
//

import UIKit

class VacancyAttributeTableViewCell: UITableViewCell {
    @IBOutlet weak var addFavorite: UIButton!
    static var myId = "VacancyAttributeTableViewCell"
    static var uinib = UINib(nibName: "VacancyAttributeTableViewCell", bundle: nil)
    var isFavorite:Bool!{
        didSet{
            if isFavorite{
                
                addFavorite.setImage(UIImage(named: "starFill"), for: .normal)
            }
            else{
                addFavorite.setImage(UIImage(named: "star"), for: .normal)
            }
        }
    }
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
        isFavorite = false
    }
    @IBAction func tappedAddFavorite(_ sender: Any) {
        isFavorite = !isFavorite
    }
}
