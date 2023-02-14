//
//  HomeTopCompanyCollectionViewCell.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 13/02/23.
//

import UIKit

class HomeTopCompanyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var companyView: UIView!
    @IBOutlet weak var companyImage: UIImageView!
    static var myId = "HomeTopCompanyCollectionViewCell"
    static var uinib = UINib(nibName: "HomeTopCompanyCollectionViewCell", bundle: nil)
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        // Initialization code
    }
    func setup(){
        companyView.layer.cornerRadius = 14
        
    }

}
