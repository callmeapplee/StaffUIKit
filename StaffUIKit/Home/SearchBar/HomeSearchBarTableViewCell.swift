//
//  HomeSearchBarTableViewCell.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 13/02/23.
//

import UIKit

class HomeSearchBarTableViewCell: UITableViewCell {
    static var myId = "HomeSearchBarTableViewCell"
    static var uinib = UINib(nibName: "HomeSearchBarTableViewCell", bundle: nil)
    @IBOutlet weak var searchBar: UISearchBar!
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup(){
        searchBar.delegate = self
    }
}
extension HomeSearchBarTableViewCell:UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}
