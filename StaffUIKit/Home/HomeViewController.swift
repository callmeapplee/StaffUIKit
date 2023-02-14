//
//  HomeViewController.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 13/02/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
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
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        if section == 0{
            let cell = myTableView.dequeueReusableCell(withIdentifier: HomeHeaderTableViewCell.myId,for: indexPath) as! HomeHeaderTableViewCell
            
            cell.backgroundColor = .clear
            return cell
        }
        else if section == 1{
            let cell = myTableView.dequeueReusableCell(withIdentifier: HomeSearchBarTableViewCell.myId,for: indexPath) as! HomeSearchBarTableViewCell
            
            cell.backgroundColor = .clear
            return cell
        }
        else if section == 2{
            let cell = myTableView.dequeueReusableCell(withIdentifier: HomeFilterTableViewCell.myId,for: indexPath) as! HomeFilterTableViewCell
            
            cell.backgroundColor = .clear
            return cell
        }
        else if section == 3{
            let cell = myTableView.dequeueReusableCell(withIdentifier: HomeTopCategoriesTableViewCell.myId,for: indexPath) as! HomeTopCategoriesTableViewCell

            cell.backgroundColor = .clear
            return cell
        }
        else if section == 4{
            let cell = myTableView.dequeueReusableCell(withIdentifier: HomeTopCompaniesTableViewCell.myId,for: indexPath) as! HomeTopCompaniesTableViewCell
            cell.backgroundColor = .clear
            return cell
        }
        else if section == 5{
            let cell = UITableViewCell(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 20))
            let label = UILabel(frame: CGRect(x: 20, y: 10, width: self.view.frame.width, height: 20))
            label.font = .systemFont(ofSize: 14, weight: .semibold)
            label.text = "Актуальные Вакансии"
            cell.addSubview(label)
            cell.backgroundColor = .clear
            return cell
        }
        else if section == 6{
            let cell = myTableView.dequeueReusableCell(withIdentifier: HomeVacancyTableViewCell.myId, for: indexPath) as! HomeVacancyTableViewCell
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    
    
}
extension HomeViewController:UITableViewDelegate{
    
}
