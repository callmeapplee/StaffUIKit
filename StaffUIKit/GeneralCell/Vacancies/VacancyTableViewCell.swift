//
//  VacancyTableViewCell.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 13/02/23.
//

import UIKit
import ShimmerSwift
class VacancyTableViewCell: UITableViewCell {
    
    
    static var myId = "VacancyTableViewCell"
    static var uinib = UINib(nibName: "VacancyTableViewCell", bundle: nil)
    var indexPath = IndexPath()
    @IBOutlet weak var shimmeringView: ShimmeringView!
    @IBOutlet weak var companyLogo: UIImageView!
    @IBOutlet weak var vacancyView: UIView!
    @IBOutlet weak var companyView: UIView!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var employerName:UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var salaryCount: UILabel!
    @IBOutlet weak var scheduleType: UILabel!
    private var _vacancy: VacancyDatum!
    var companyDataService = CompanyDataService()
    var vacancy: VacancyDatum! {
        set {
            _vacancy = newValue
            position.text = _vacancy.position ?? ""
            employerName.text = _vacancy.employer.name
            cityName.text = _vacancy.city.nameRu
            let l = String(_vacancy.salaryMin), r = String(_vacancy.salaryMax)
            if l == "0" && r == "0" {
                salaryCount.text = "Договорная"
            } else if l == "0" {
                salaryCount.text = "До " + r
            } else if r == "0" {
                salaryCount.text = "От " + l
            } else if l == r {
                salaryCount.text = l
            } else {
                salaryCount.text = l + " - " + r
            }
            scheduleType.text = _vacancy.scheduleType.name
            var contains = false
            for i in CompanyDataService.companiesDB{
                if i.id == vacancy.employerID{
                    if i.logoURL == vacancy.employer.logo{
                        contains = true
                        companyLogo.image = UIImage(data: i.logo!)
                        shimmeringView.isShimmering = false
                    }
                    else{
                        companyDataService.delete(companyDB: i)
                    }
                }
            }
            if !contains {
                NetworkService.getImage(pathURL: vacancy.employer.logo) { [self] response in
                    if let data = response{
                        companyDataService.add(logoURl: vacancy.employer.logo, id: vacancy.employerID, logo: data)
                        companyLogo.image = UIImage(data: data)
                        shimmeringView.isShimmering = false
                    }
                    
                }
                
            }
        }
        get {
            return _vacancy
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        // Initialization code
    }
    func setup(){
        shimmeringView.isShimmering = true
        shimmeringView.contentView = companyLogo
        shimmeringView.layer.cornerRadius = 12
        vacancyView.layer.cornerRadius = 12
        companyView.layer.cornerRadius = 12
        companyLogo.layer.cornerRadius = 12
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
