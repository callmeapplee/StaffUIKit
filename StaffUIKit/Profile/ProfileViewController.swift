//
//  ProfileViewController.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 17/02/23.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var profileDescription: UILabel!
    @IBOutlet weak var createCV: UIButton!
    @IBOutlet weak var profileName: UILabel!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        // Do any additional setup after loading the view.
    }
    
    func setup(){
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.layer.borderWidth  = 5
        profileImage.layer.borderColor = UIColor(red: 0.892, green: 0.892, blue: 0.892, alpha: 1).cgColor
        
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
