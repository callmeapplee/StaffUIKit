//
//  HomeFilterTableViewCell.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 13/02/23.
//

import UIKit

class HomeFilterTableViewCell: UITableViewCell {
    static var myId = "HomeFilterTableViewCell"
    static var uinib = UINib(nibName: "HomeFilterTableViewCell", bundle: nil)
    var citiesPicker = UIPickerView()
    var categoriesPicker = UIPickerView()
    static var cities:[HomeCity] = []
    static var categories:[HomeTopCategory] = []
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var filterView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        setupToolBar()
        // Initialization code
    }
    func setup(){
        filterView.layer.cornerRadius = 12
        filterBtn.layer.cornerRadius = 8
        filterBtn.clipsToBounds = true
        citiesPicker.delegate = self
        citiesPicker.dataSource = self
        categoriesPicker.delegate = self
        categoriesPicker.dataSource = self
        cityTextField.inputView = citiesPicker
        categoryTextField.inputView = categoriesPicker
    }
    func setupToolBar(){
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(closeInputView))
        doneButton.tintColor = .blue
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(closeInputView))
        cancelButton.tintColor = .red
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        cityTextField.inputAccessoryView = toolBar
        categoryTextField.inputAccessoryView = toolBar
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension HomeFilterTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if citiesPicker == pickerView{
            return HomeFilterTableViewCell.cities.count
        }
        else{
            return HomeFilterTableViewCell.categories.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if citiesPicker == pickerView{
            return HomeFilterTableViewCell.cities[row].nameRu
        }
        else{
            return HomeFilterTableViewCell.cities[row].nameRu
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if citiesPicker == pickerView{
            cityTextField.text =  HomeFilterTableViewCell.cities[row].nameRu
        }
        else{
            categoryTextField.text = HomeFilterTableViewCell.cities[row].nameRu
        }
    }
    
}
extension HomeFilterTableViewCell{
    @objc func closeInputView(){
        cityTextField.resignFirstResponder()
        categoryTextField.resignFirstResponder()
    }
}
