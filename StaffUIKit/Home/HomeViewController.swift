//
//  HomeViewController.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 13/02/23.
//

import UIKit
import ShimmerSwift
import Alamofire
protocol FilterParams{
    func didChange()
}
class HomeViewController: UIViewController {
    var requestTimer = Timer()
    var backgroundTap = UITapGestureRecognizer()
    @IBOutlet weak var myTableView: UITableView!
    var homeSearchBar = HomeSearchBarTableViewCell()
    var homeFilter = HomeFilterTableViewCell()
    var filtered = false
    static var activeCompanies:[VacancyDatum] = []
    static var filterVacancies:[VacancyDatum] = []
    static var filterParams = ["","","","","","",""]
    var activeVacanciesPage = 1
    var filterVacanciesPage = 1
    var filterVacancyFetchingMore = false
    var activeVacancyFetchingMore = false
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
        myTableView.register(HomeHeaderTableViewCell.uinib, forCellReuseIdentifier: HomeHeaderTableViewCell.myId)
        myTableView.register(HomeSearchBarTableViewCell.uinib, forCellReuseIdentifier: HomeSearchBarTableViewCell.myId)
        myTableView.register(HomeFilterTableViewCell.uinib, forCellReuseIdentifier: HomeFilterTableViewCell.myId)
        myTableView.register(HomeTopCategoriesTableViewCell.uinib, forCellReuseIdentifier: HomeTopCategoriesTableViewCell.myId)
        myTableView.register(HomeTopCompaniesTableViewCell.uinib, forCellReuseIdentifier: HomeTopCompaniesTableViewCell.myId)
        myTableView.register(HomeVacancyTableViewCell.uinib, forCellReuseIdentifier: HomeVacancyTableViewCell.myId)
        myTableView.register(IndicatorTableViewCell.uinib, forCellReuseIdentifier: IndicatorTableViewCell.myId)
        
    }
    func setup(){
        backgroundTap.addTarget(self, action: #selector(closeInputView))
        self.view.addGestureRecognizer(backgroundTap)
        HomeNetworkService.getHomeData { [self] home in
            if home != nil{
                StaticData.topCompanies = home?.response.topCompanies ?? []
                StaticData.topCategories = home?.response.topCategories ?? []
                StaticData.cities = home?.response.cities ?? []
                StaticData.categories = home?.response.topCategories ?? []
                StaticData.cities.insert(City(id: 0, nameTj: "Все города", nameRu: "Все города", nameEn: "Все города", status: 0), at: 0)
                StaticData.categories.insert(TopCategory(id: 0, name: "Все категории", icon: ""), at: 0)
                myTableView.reloadData()
            }
        }
        HomeNetworkService.getActiveVacancyData(page: String(describing: 1), perPage: String(describing: 20)) {[self] vacancy in
            if vacancy != nil{
                HomeViewController.activeCompanies = vacancy?.response.data ?? []
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
            return HomeViewController.activeCompanies.count
        }
        else if section == 7{
            return HomeViewController.filterVacancies.count
        }
        else{
            return 1
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 9
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
                return 160
            }
        }
        else if indexPath.section == 4{
            if filtered{
                return 0
            }
            else{
                return 138
            }
        }
        else if indexPath.section == 5{
            if filtered{
                return 0
            }
            else{
                return 38
            }
        }
        else if indexPath.section == 6{
            if filtered{
                return 0
            }
            else{
                return 120
            }
        }
        else if indexPath.section == 7{
            if filtered{
                return 120
            }
            else{
                return 0
            }
        }
        else if indexPath.section == 8{
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
            let cell = myTableView.dequeueReusableCell(withIdentifier: HomeHeaderTableViewCell.myId,for: indexPath) as! HomeHeaderTableViewCell
            
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
        else if section == 1{
            let cell = myTableView.dequeueReusableCell(withIdentifier: HomeSearchBarTableViewCell.myId,for: indexPath) as! HomeSearchBarTableViewCell
            homeSearchBar = cell
            homeSearchBar.filterDelegate = self
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
        else if section == 2{
            let cell = myTableView.dequeueReusableCell(withIdentifier: HomeFilterTableViewCell.myId,for: indexPath) as! HomeFilterTableViewCell
            homeFilter = cell
            homeFilter.filterDelegate = self
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
            let cell = myTableView.dequeueReusableCell(withIdentifier: "cell")!
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
            cell.vacancy = HomeViewController.activeCompanies[row]
            
            cell.selectionStyle = .none
            return cell
        }
        else if section == 7{
            let cell = myTableView.dequeueReusableCell(withIdentifier: HomeVacancyTableViewCell.myId, for: indexPath) as! HomeVacancyTableViewCell
            let row = indexPath.row
            
            cell.vacancy = HomeViewController.filterVacancies[row]
            
            cell.selectionStyle = .none
            return cell
        }
        else if section == 8{
            let cell = myTableView.dequeueReusableCell(withIdentifier: IndicatorTableViewCell.myId) as! IndicatorTableViewCell
            cell.indicator.startAnimating()
            
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    
    
}
extension HomeViewController:UITableViewDelegate{
    
}
extension HomeViewController:FilterParams{
    func didChange() {
        filtered = isFiltered()
        if !loadingTime{
            loadingTime = true
            myTableView.reloadSections([3,4,5,6,7,8], with: .automatic)
        }
        requestTimer.invalidate()
        requestTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(makeTimerRequest), userInfo: nil, repeats: false)
        
        
    }
    func isFiltered()->Bool{
        for i in HomeViewController.filterParams{
            if i != ""{
                return true
            }
        }
        return false
    }
}
extension HomeViewController{
    @objc func closeInputView(){
        homeSearchBar.searchBar.resignFirstResponder()
        homeFilter.closeInputView()
    }
    @objc func makeTimerRequest(){
        if filtered{
            filterVacanciesPage = 1
            
            HomeNetworkService.getFilterVacancyData(page: String(describing:self.filterVacanciesPage), perPage: String(describing: 20)) {[self] vacancy in
                if vacancy != nil{
                    HomeViewController.filterVacancies = vacancy?.response.data ?? []
                }
                loadingTime = false
                myTableView.reloadSections([3,4,5,6,7,8], with: .none)
                
            }
            
            
        }
        else{
            loadingTime = false
            myTableView.reloadSections([3,4,5,6,7,8], with: .none)
        }
    }
}
extension HomeViewController{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        print(loadingTime)
        if offsetY > contentHeight - scrollView.frame.height + 30 {
            if filtered && !filterVacancyFetchingMore{
                filterVacanciesPage += 1
                filterVacancyFetchingMore = true
                HomeNetworkService.getFilterVacancyData(page: String(describing:filterVacanciesPage), perPage: String(describing: 20)) {[self] vacancy in
                    if vacancy != nil{
                        filterVacancyFetchingMore = false
                        let temp = vacancy?.response.data ?? []
                        for i in temp{
                            HomeViewController.filterVacancies.append(i)
                        }
                    }
                    myTableView.reloadData()
                }
            }
            else if !activeVacancyFetchingMore && !filtered{
                activeVacanciesPage += 1
                activeVacancyFetchingMore = true
                HomeNetworkService.getActiveVacancyData(page: String(describing: activeVacanciesPage), perPage: String(describing: 20)) { [self] vacancy in
                    if vacancy != nil{
                        activeVacancyFetchingMore = false
                        let temp = vacancy?.response.data ?? []
                        for i in temp{
                            HomeViewController.activeCompanies.append(i)
                        }
                        myTableView.reloadData()
                    }
                }
            }
            
        }
    }
}
