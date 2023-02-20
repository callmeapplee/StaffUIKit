//
//  CompaniesSearchBarTableViewCell.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 17/02/23.
//

import UIKit

class CompaniesSearchBarTableViewCell: UITableViewCell {
    static var myId = "CompaniesSearchBarTableViewCell"
    static var uinib = UINib(nibName: "CompaniesSearchBarTableViewCell", bundle: nil)
    var filterDelegate:FilterParams?
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
extension CompaniesSearchBarTableViewCell:UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count >= 3{
            CompaniesViewController.filterParams[0] = "&search_text=\(searchText)"
        }
        else{
            CompaniesViewController.filterParams[0] = ""
        }
        filterDelegate?.didChange()
    }
}
