//
//  CompanyDetailHeaderUTableViewCell.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 20/02/23.
//

import UIKit

class CompanyDetailHeaderUTableViewCell: UITableViewCell {
    var vc = UIViewController()
    @IBOutlet weak var favorite:UIButton!
    @IBOutlet weak var companyImage:UIImageView!
    @IBOutlet weak var companyView:UIView!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var goBack: UIButton!
    
    static var myId = "CompanyDetailHeaderUTableViewCell"
    static var uinib = UINib(nibName: "CompanyDetailHeaderUTableViewCell", bundle: nil)
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        // Initialization code
    }
    func setup(){
        favorite.layer.cornerRadius = 12
        companyImage.layer.cornerRadius = 12
        companyView.layer.cornerRadius = 12
        myView.layer.contents = UIImage(named:"employerBackground")?.cgImage
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBAction func tappedGoBack(_ sender: Any) {
        vc.navigationController?.popViewController(animated: true)
    }
    
}
