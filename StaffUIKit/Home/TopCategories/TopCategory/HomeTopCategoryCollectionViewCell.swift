//
//  HomeTopCategoryCollectionViewCell.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 13/02/23.
//

import UIKit

class HomeTopCategoryCollectionViewCell: UICollectionViewCell {
    static var myId = "HomeTopCategoryCollectionViewCell"
    static var uinib = UINib(nibName: "HomeTopCategoryCollectionViewCell", bundle: nil)
    @IBOutlet weak var categoryView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        // Initialization code
    }
    func setup(){
        categoryView.layer.cornerRadius = 12
    }

}
