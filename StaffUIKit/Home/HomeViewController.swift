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
        
        // Do any additional setup after loading the view.
    }
    func configureTableView(){
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(HomeHeaderTableViewCell.uinib, forCellReuseIdentifier: HomeHeaderTableViewCell.myId)
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
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        if row == 0{
            let cell = myTableView.dequeueReusableCell(withIdentifier: HomeHeaderTableViewCell.myId) as! HomeHeaderTableViewCell
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    
    
}
extension HomeViewController:UITableViewDelegate{
    
}
