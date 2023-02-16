//
//  HomeTopCategoryCollectionViewCell.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 13/02/23.
//

import UIKit
import ShimmerSwift
class HomeTopCategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var shimmerView: UIView!
    @IBOutlet weak var categoryImage:UIImageView!
    static var myId = "HomeTopCategoryCollectionViewCell"
    static var uinib = UINib(nibName: "HomeTopCategoryCollectionViewCell", bundle: nil)
    var categoryDataService = CategoryDataService()
    var category:HomeTopCategory!{
        didSet{
            categoryName.text = category.name
            var contains = false
            for i in CategoryDataService.categoriesDB{
                if i.id == category.id{
                    if i.logoURL == category.icon{
                        contains = true
                        categoryImage.image = UIImage(data: i.logo!)
                    }
                    else{
                        categoryDataService.delete(categoryDB: i)
                    }
                }
            }
            if !contains {
                NetworkService.getImage(pathURL: category.icon) { [self] response in
                    if let data = response{
                        categoryDataService.add(logoURl: category.icon, id: category.id, logo: data)
                        categoryImage.image = UIImage(data: data)
                    }
                    
                }
                
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        // Initialization code
    }
    func setup(){
        shimmerView.layer.cornerRadius = 12
    }

}
