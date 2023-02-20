//
//  CompaniesViewController.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 17/02/23.
//

import UIKit
import ShimmerSwift
import Alamofire
class CompaniesViewController: UIViewController {
    
    
    var requestTimer = Timer()
    var backgroundTap = UITapGestureRecognizer()
    @IBOutlet weak var myTableView: UITableView!
    var companiesSearchBar = CompaniesSearchBarTableViewCell()
    var companiesFilter = CompaniesFilterTableViewCell()
    var filtered = false
    static var activeCompanies:[CompanyDatum] = []
    static var filterCompanies:[CompanyDatum] = []
    static var filterParams = ["","","","","","",""]
    var activeCompaniesPage = 1
    var filterCompaniesPage = 1
    var filterCompanyFetchingMore = false
    var activeCompanyFetchingMore = false
    var loadingTime = false
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setup()
        
        // Do any additional setup after loading the view.
    }
    func configureTableView(){
        myTableView.rowHeight = UITableView.automaticDimension
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(CompaniesHeaderTableViewCell.uinib, forCellReuseIdentifier: CompaniesHeaderTableViewCell.myId)
        myTableView.register(CompaniesSearchBarTableViewCell.uinib, forCellReuseIdentifier: CompaniesSearchBarTableViewCell.myId)
        myTableView.register(CompaniesFilterTableViewCell.uinib, forCellReuseIdentifier: CompaniesFilterTableViewCell.myId)
        myTableView.register(CompaniesTopCompanyTableViewCell.uinib, forCellReuseIdentifier: CompaniesTopCompanyTableViewCell.myId)
        myTableView.register(CompaniesCompanyTableViewCell.uinib, forCellReuseIdentifier: CompaniesCompanyTableViewCell.myId)
        myTableView.register(IndicatorTableViewCell.uinib, forCellReuseIdentifier: IndicatorTableViewCell.myId)
    }
    func setup(){
        backgroundTap.addTarget(self, action: #selector(closeInputView))
        self.view.addGestureRecognizer(backgroundTap)
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
extension CompaniesViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 5{
            return CompaniesViewController.activeCompanies.count
        }
        else if section == 6{
            return CompaniesViewController.filterCompanies.count
        }
        else{
            return 1
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 100
        }
        else if indexPath.section == 1{
            return 55
        }
        else if indexPath.section == 2{
            return 75
        }
        else if indexPath.section == 3{
            if filtered{
                return 0
            }
            else{
                return 138
            }
        }
        else if indexPath.section == 4{
            if filtered{
                return 0
            }
            else{
                return 38
            }
        }
        else if indexPath.section == 5{
            if filtered{
                return 0
            }
            else{
                return 120
            }
        }
        else if indexPath.section == 6{
            if filtered{
                return 120
            }
            else{
                return 0
            }
        }
        else if indexPath.section == 7{
            if loadingTime{
                return myTableView.frame.size.height - 250
            }
            else{
                return 0
            }
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        if section == 0{
            let cell = myTableView.dequeueReusableCell(withIdentifier: CompaniesHeaderTableViewCell.myId,for: indexPath) as! CompaniesHeaderTableViewCell
            cell.backgroundColor = .clear   
            cell.selectionStyle = .none
            return cell
        }
        else if section == 1{
            let cell = myTableView.dequeueReusableCell(withIdentifier: CompaniesSearchBarTableViewCell.myId,for: indexPath) as! CompaniesSearchBarTableViewCell
            companiesSearchBar = cell
            companiesSearchBar.filterDelegate = self
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
        else if section == 2{
            let cell = myTableView.dequeueReusableCell(withIdentifier: CompaniesFilterTableViewCell.myId,for: indexPath) as! CompaniesFilterTableViewCell
            companiesFilter = cell
            companiesFilter.filterDelegate = self
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
        else if section == 3{
            let cell = myTableView.dequeueReusableCell(withIdentifier: CompaniesTopCompanyTableViewCell.myId,for: indexPath) as! CompaniesTopCompanyTableViewCell
            cell.myCollectionView.reloadData()
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
        else if section == 4{
            let cell = myTableView.dequeueReusableCell(withIdentifier: "cell")!
            let label = UILabel(frame: CGRect(x: 20, y: 0, width: self.view.frame.width, height: 20))
            label.font = .systemFont(ofSize: 14, weight: .semibold)
            label.text = "Компании по количеству вакансий"
            cell.addSubview(label)
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
        else if section == 5{
            let cell = myTableView.dequeueReusableCell(withIdentifier: CompaniesCompanyTableViewCell.myId, for: indexPath) as! CompaniesCompanyTableViewCell
            let row = indexPath.row
           // cell.vacancy = HomeViewController.activeVacancies[row]
            
            cell.selectionStyle = .none
            return cell
        }
        else if section == 6{
            let cell = myTableView.dequeueReusableCell(withIdentifier: CompaniesCompanyTableViewCell.myId, for: indexPath) as! CompaniesCompanyTableViewCell
            let row = indexPath.row
            
       //     cell.vacancy = HomeViewController.filterVacancies[row]
            
            cell.selectionStyle = .none
            return cell
        }
        else if section == 7{
            let cell = myTableView.dequeueReusableCell(withIdentifier: IndicatorTableViewCell.myId) as! IndicatorTableViewCell
            cell.indicator.startAnimating()
            
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    
    
}
extension CompaniesViewController:UITableViewDelegate, FilterParams {
    func didChange() {
        filtered = isFiltered()
        if !loadingTime{
            loadingTime = true
            myTableView.reloadSections([3,4,5,6,7], with: .automatic)
        }
        requestTimer.invalidate()
        requestTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(makeTimerRequest), userInfo: nil, repeats: false)
        
        
    }
    func isFiltered()->Bool{
        for i in CompaniesViewController.filterParams{
            if i != ""{
                return true
            }
        }
        return false
    }
}

extension CompaniesViewController{
    @objc func closeInputView(){
      //  homeSearchBar.searchBar.resignFirstResponder()
        companiesFilter.closeInputView()
    }
    @objc func makeTimerRequest(){
        if filtered{
            filterCompaniesPage = 1
            
//            HomeNetworkService.getFilterVacancyData(page: String(describing:self.filterVacanciesPage), perPage: String(describing: 20)) {[self] vacancy in
//                if vacancy != nil{
//                    HomeViewController.filterVacancies = vacancy?.response.data ?? []
//                }
//                loadingTime = false
//                myTableView.reloadSections([3,4,5,6,7], with: .none)
//
//            }
            
            
        }
        else{
            loadingTime = false
            myTableView.reloadSections([3,4,5,6,7], with: .none)
        }
    }
}
extension CompaniesViewController{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        print(loadingTime)
        if offsetY > contentHeight - scrollView.frame.height + 30 {
//            if filtered && !filterVacancyFetchingMore{
//                filterVacanciesPage += 1
//                filterVacancyFetchingMore = true
//                HomeNetworkService.getFilterVacancyData(page: String(describing:filterVacanciesPage), perPage: String(describing: 20)) {[self] vacancy in
//                    if vacancy != nil{
//                        filterVacancyFetchingMore = false
//                        let temp = vacancy?.response.data ?? []
//                        for i in temp{
//                            HomeViewController.filterVacancies.append(i)
//                        }
//                    }
//                    myTableView.reloadData()
//                }
//            }
//            else if !activeVacancyFetchingMore && !filtered{
//                activeVacanciesPage += 1
//                activeVacancyFetchingMore = true
//                HomeNetworkService.getActiveVacancyData(page: String(describing: activeVacanciesPage), perPage: String(describing: 20)) { [self] vacancy in
//                    if vacancy != nil{
//                        activeVacancyFetchingMore = false
//                        let temp = vacancy?.response.data ?? []
//                        for i in temp{
//                            HomeViewController.activeVacancies.append(i)
//                        }
//                        myTableView.reloadData()
//                    }
//                }
//            }
            
        }
    }
}
