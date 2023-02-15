//
//  HomeTopCategoriesTableViewCell.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 13/02/23.
//

import UIKit

class HomeTopCategoriesTableViewCell: UITableViewCell {
    static var myId = "HomeTopCategoriesTableViewCell"
    static var uinib = UINib(nibName: "HomeTopCategoriesTableViewCell", bundle: nil)
    static var topCategories:[HomeTopCategory] = []
    @IBOutlet weak var myCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureCollectionView()
        // Initialization code
    }
    func configureCollectionView(){
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(HomeTopCategoryCollectionViewCell.uinib, forCellWithReuseIdentifier: HomeTopCategoryCollectionViewCell.myId)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
extension HomeTopCategoriesTableViewCell:UICollectionViewDelegate{
    
}
extension HomeTopCategoriesTableViewCell:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeTopCategoriesTableViewCell.topCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: HomeTopCategoryCollectionViewCell.myId, for: indexPath) as! HomeTopCategoryCollectionViewCell
        let category = HomeTopCategoriesTableViewCell.topCategories[indexPath.row]
        cell.categoryName.text = category.name
        return cell
    }
}
extension HomeTopCategoriesTableViewCell:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 74, height: 96)
    }
}
