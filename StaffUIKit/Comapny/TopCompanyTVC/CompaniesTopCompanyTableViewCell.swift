//
//  CompaniesTopCompanyTableViewCell.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 20/02/23.
//

import UIKit

class CompaniesTopCompanyTableViewCell: UITableViewCell {
    static var myId = "CompaniesTopCompanyTableViewCell"
    static var uinib = UINib(nibName: "CompaniesTopCompanyTableViewCell", bundle: nil)
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
        // Initialization code
    }
    func configureCollectionView(){
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.register(HomeTopCompanyCollectionViewCell.uinib, forCellWithReuseIdentifier: HomeTopCompanyCollectionViewCell.myId)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension CompaniesTopCompanyTableViewCell:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StaticData.topCompanies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: HomeTopCompanyCollectionViewCell.myId, for: indexPath) as! HomeTopCompanyCollectionViewCell
        cell.company = StaticData.topCompanies[indexPath.row]
        return cell
    }
    
    
}
extension CompaniesTopCompanyTableViewCell:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 74, height: 74)
    }
}
