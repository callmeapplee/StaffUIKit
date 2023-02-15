//
//  HomeVacancyTableViewCell.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 13/02/23.
//

import UIKit

class HomeVacancyTableViewCell: UITableViewCell {
    static var myId = "HomeVacancyTableViewCell"
    static var uinib = UINib(nibName: "HomeVacancyTableViewCell", bundle: nil)
    @IBOutlet weak var vacancyView: UIView!
    @IBOutlet weak var companyView: UIView!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var employerName:UILabel!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var salaryCount: UILabel!
    @IBOutlet weak var scheduleType: UILabel!
    private var _vacancy: VacancyDatum!

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
        vacancyView.layer.cornerRadius = 12
        companyView.layer.cornerRadius = 12
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
