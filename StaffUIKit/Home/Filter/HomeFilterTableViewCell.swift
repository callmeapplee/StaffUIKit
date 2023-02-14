//
//  HomeFilterTableViewCell.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 13/02/23.
//

import UIKit

class HomeFilterTableViewCell: UITableViewCell {
    static var myId = "HomeFilterTableViewCell"
    static var uinib = UINib(nibName: "HomeFilterTableViewCell", bundle: nil)
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var filterView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        // Initialization code
    }
    func setup(){
        filterView.layer.cornerRadius = 12
        filterBtn.layer.cornerRadius = 8
        filterBtn.clipsToBounds = true
        filterBtn.imageView!.contentMode = .scaleAspectFit
        filterBtn.contentMode = .scaleAspectFit
       // filterBtn.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
