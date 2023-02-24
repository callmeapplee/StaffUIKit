//
//  VacancyDetailViewController.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 20/02/23.
//

import UIKit

class VacancyDetailViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    var vacancyDetailHeader = VacancyDetailHeaderTableViewCell()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        // Do any additional setup after loading the view.
    }
    func configureTableView(){
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(VacancyDetailHeaderTableViewCell.uinib, forCellReuseIdentifier: VacancyDetailHeaderTableViewCell.myId)
        myTableView.register(VacancyInfoTableViewCell.uinib, forCellReuseIdentifier: VacancyInfoTableViewCell.myId)
        myTableView.register(VacancyAttributeTableViewCell.uinib, forCellReuseIdentifier: VacancyAttributeTableViewCell.myId)
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
extension VacancyDetailViewController:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section, row = indexPath.row
        if section == 0{
            let cell = myTableView.dequeueReusableCell(withIdentifier: VacancyDetailHeaderTableViewCell.myId) as! VacancyDetailHeaderTableViewCell
            cell.vc = self
            cell.selectionStyle = .none
            return cell
        }
        else if section == 1{
            let cell = myTableView.dequeueReusableCell(withIdentifier: VacancyInfoTableViewCell.myId) as! VacancyInfoTableViewCell
            cell.selectionStyle = .none
            return cell
        }
        else if section == 2{
            let cell = myTableView.dequeueReusableCell(withIdentifier: VacancyAttributeTableViewCell.myId) as! VacancyAttributeTableViewCell
            cell.selectionStyle = .none
            return cell
        }
        else if section == 3{
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
        else if section == 4{
            let cell = myTableView.dequeueReusableCell(withIdentifier: "cell")!
            let label = UILabel(frame: CGRect(x: 20, y: 0, width: self.view.frame.width, height: 20))
            label.font = .systemFont(ofSize: 14, weight: .semibold)
            label.text = "Похожие вакансии"
            cell.addSubview(label)
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        }
        else if section == 5{
            let cell = myTableView.dequeueReusableCell(withIdentifier:VacancyTableViewCell.myId) as! VacancyTableViewCell
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        if section == 2{
            return 34 + 38
        }
        else if section == 4{
            return 38
        }
        return tableView.rowHeight
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        if section == 5 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "VacancyDetailViewController") as! VacancyDetailViewController
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
