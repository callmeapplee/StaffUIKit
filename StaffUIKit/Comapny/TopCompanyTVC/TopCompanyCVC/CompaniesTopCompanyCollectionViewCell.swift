//
//  CompaniesTopCompanyCollectionViewCell.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 20/02/23.
//

import UIKit

class CompaniesTopCompanyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var companyView: UIView!
    @IBOutlet weak var companyImage: UIImageView!
    static var myId = "CompaniesTopCompanyCollectionViewCell"
    static var uinib = UINib(nibName: "CompaniesTopCompanyCollectionViewCell", bundle: nil)
    var companyDataService = CompanyDataService()
    var company:TopCompany!{
        didSet{
            var contains = false
            for i in CompanyDataService.companiesDB{
                if i.id == company.id{
                    if i.logoURL == company.logo{
                        contains = true
                        companyImage.image = UIImage(data: i.logo!)
                    }
                    else{
                        companyDataService.delete(companyDB: i)
                    }
                }
            }
            if !contains {
                NetworkService.getImage(pathURL: company.logo) { [self] response in
                    if let data = response{
                        companyDataService.add(logoURl: company.logo, id: company.id, logo: data)
                        companyImage.image = UIImage(data: data)
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
        companyView.layer.cornerRadius = 14
        
    }

}
