//
//  HomeViewController.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 13/02/23.
//

import UIKit

class HomeViewController: UIViewController {
    var backgroundTap = UITapGestureRecognizer()
    @IBOutlet weak var myTableView: UITableView!
    var homeSearchBar = HomeSearchBarTableViewCell()
    var homeFilter = HomeFilterTableViewCell()
    static var activeVacancies:[VacancyDatum] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setup()
        // Do any additional setup after loading the view.
    }
    func configureTableView(){
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(HomeHeaderTableViewCell.uinib, forCellReuseIdentifier: HomeHeaderTableViewCell.myId)
        myTableView.register(HomeSearchBarTableViewCell.uinib, forCellReuseIdentifier: HomeSearchBarTableViewCell.myId)
        myTableView.register(HomeFilterTableViewCell.uinib, forCellReuseIdentifier: HomeFilterTableViewCell.myId)
        myTableView.register(HomeTopCategoriesTableViewCell.uinib, forCellReuseIdentifier: HomeTopCategoriesTableViewCell.myId)
        myTableView.register(HomeTopCompaniesTableViewCell.uinib, forCellReuseIdentifier: HomeTopCompaniesTableViewCell.myId)
        myTableView.register(HomeVacancyTableViewCell.uinib, forCellReuseIdentifier: HomeVacancyTableViewCell.myId)
        
    }   
    func setup(){
        backgroundTap.addTarget(self, action: #selector(closeInputView))
        self.view.addGestureRecognizer(backgroundTap)
        HomeNetworkService.getHomeData { [self] home in
            if home != nil{
                HomeTopCompaniesTableViewCell.topCompanies = home?.response.topCompanies ?? []
                HomeTopCategoriesTableViewCell.topCategories = home?.response.topCategories ?? []
                HomeFilterTableViewCell.cities = home?.response.cities ?? []
                HomeFilterTableViewCell.categories = home?.response.topCategories ?? []
                myTableView.reloadData()
            }
        }
        HomeNetworkService.getActiveVacancyData(page: String(describing: 1), perPage: String(describing: 20)) {[self] vacancy in
            if vacancy != nil{
                HomeViewController.activeVacancies = vacancy?.response.data ?? []
                myTableView.reloadData()
            }
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension HomeViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 6{
            return HomeViewController.activeVacancies.count
        }
        else{
            return 1
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 85
        }
        else if indexPath.section == 1{
            return 55
        }
        else if indexPath.section == 2{
            return 42
            
        }
        if indexPath.section == 3{
            return 160
        }
        else if indexPath.section == 4{
            return 138
        }
        else if indexPath.section == 5{
            return 20
        }
        else if indexPath.section == 6{
            return 120
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        if section == 0{
            let cell = myTableView.dequeueReusableCell(withIdentifier: HomeHeaderTableViewCell.myId,for: indexPath) as! HomeHeaderTableViewCell
            
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
        else if section == 1{
            let cell = myTableView.dequeueReusableCell(withIdentifier: HomeSearchBarTableViewCell.myId,for: indexPath) as! HomeSearchBarTableViewCell
            homeSearchBar = cell
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
        else if section == 2{
            let cell = myTableView.dequeueReusableCell(withIdentifier: HomeFilterTableViewCell.myId,for: indexPath) as! HomeFilterTableViewCell
            homeFilter = cell
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
        else if section == 3{
            let cell = myTableView.dequeueReusableCell(withIdentifier: HomeTopCategoriesTableViewCell.myId,for: indexPath) as! HomeTopCategoriesTableViewCell
            cell.myCollectionView.reloadData()
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
        else if section == 4{
            let cell = myTableView.dequeueReusableCell(withIdentifier: HomeTopCompaniesTableViewCell.myId,for: indexPath) as! HomeTopCompaniesTableViewCell
            cell.myCollectionView.reloadData()
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
        else if section == 5{
            let cell = UITableViewCell()
            let label = UILabel(frame: CGRect(x: 20, y: 0, width: self.view.frame.width, height: 20))
            label.font = .systemFont(ofSize: 14, weight: .semibold)
            label.text = "Актуальные Вакансии"
            cell.addSubview(label)
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
        else if section == 6{
            let cell = myTableView.dequeueReusableCell(withIdentifier: HomeVacancyTableViewCell.myId, for: indexPath) as! HomeVacancyTableViewCell
            let row = indexPath.row
            cell.vacancy = HomeViewController.activeVacancies[row]
            cell.selectionStyle = .none
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    
    
}
extension HomeViewController:UITableViewDelegate{
    
}
extension HomeViewController{
    @objc func closeInputView(){
        homeSearchBar.searchBar.resignFirstResponder()
        homeFilter.closeInputView()
    }
}
