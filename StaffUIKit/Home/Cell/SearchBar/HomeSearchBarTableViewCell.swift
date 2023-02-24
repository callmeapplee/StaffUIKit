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
extension HomeSearchBarTableViewCell:UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count >= 3{
            HomeViewController.filterParams[0] = "&search_text=\(searchText)"
        }
        else{
            HomeViewController.filterParams[0] = ""
        }
        filterDelegate?.didChange()
    }
}
