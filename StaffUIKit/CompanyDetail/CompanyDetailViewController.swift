//
//  CompanyDetailViewController.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 20/02/23.
//

import UIKit

class CompanyDetailViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureTableView()
        // Do any additional setup after loading the view.
    }
    
    func setup(){
        
    }
    func configureTableView(){
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(CompanyDetailHeaderUTableViewCell.uinib, forCellReuseIdentifier: CompanyDetailHeaderUTableViewCell.myId)
        myTableView.register(VacancyTableViewCell.uinib, forCellReuseIdentifier: VacancyTableViewCell.myId)
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
extension CompanyDetailViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        if section == 0{
            let cell = myTableView.dequeueReusableCell(withIdentifier: CompanyDetailHeaderUTableViewCell.myId) as! CompanyDetailHeaderUTableViewCell
            cell.selectionStyle = .none
            cell.vc = self
            return cell
        }
        else if section == 1{
            let cell = UITableViewCell()
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            label.font = .systemFont(ofSize: 14, weight: .light)
            label.text = "В конце 2015 года, Telia Company, главный акционер Tcell, объявила решение о выходе с Евразийского рынка. С апреля 2017 года, Фонд Ага Хана по Экономическому Развитию (AKFED) – единственный владелец Tcell.AKFED – международное агентство по развитию, занимающееся поощрением предпринимательства и созданием экономически устойчивых предприятий. Работа AKFED осуществляется по высшим этическим стандартам, и с заботой об обществе, в котором Фонд функционирует."
            cell.addSubview(label)
            label.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 20).isActive = true
            label.rightAnchor.constraint(equalTo: cell.rightAnchor, constant: -20).isActive = true
            label.topAnchor.constraint(equalTo: cell.topAnchor, constant: 0).isActive = true
            label.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: -30).isActive = true
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            print(cell.frame.height)
            return cell
        }
        else if section == 2{
            let cell = myTableView.dequeueReusableCell(withIdentifier: "cell")!
            let label = UILabel(frame: CGRect(x: 20, y: 0, width: self.view.frame.width, height: 20))
            label.font = .systemFont(ofSize: 14, weight: .semibold)
            label.text = "Вакансии компании"
            cell.addSubview(label)
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
        else if section == 3{
            let cell = myTableView.dequeueReusableCell(withIdentifier: VacancyTableViewCell.myId) as! VacancyTableViewCell
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        if section == 0{
            return 316
        }
        else if section == 1{
            return tableView.rowHeight
        }
        else if section == 2{
            return 38
        }
        else if section == 3{
            return 120
        }
        return 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        if section == 3 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "CompanyDetailViewController") as! CompanyDetailViewController
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
