//
//  HomeBottomSheetViewController.swift
//  StaffUIKit
//
//  Created by Ботурбек Имомдодов on 21/02/23.
//
import UIKit
import WARangeSlider

class HomeBottomSheetViewController: UIViewController {
    var filterDelegate:FilterParams!
    var cityPicker = UIPickerView()
    var categoryPicker = UIPickerView()
    var scheduleTypePicker = UIPickerView()
    var experiencePicker = UIPickerView()
    @IBOutlet weak var upperSum: UILabel!
    @IBOutlet weak var lowerSum: UILabel!
    @IBOutlet weak var rangeSlider: RangeSlider!
    @IBOutlet weak var bottomSheetView: UIView!
    @IBOutlet weak var rangeSliderView:UIView!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var scheduleTypeTextField: UITextField!
    @IBOutlet weak var experienceTextField: UITextField!
    var tap = UITapGestureRecognizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    func checkSalary(salary:String)->Double?{
        if salary != ""{
            var tempString = ""
            var ok = false
            for i in salary {
                if ok {
                    tempString += String(i)
                }
                if i == "=" {
                    ok = true
                }
            }
            var x = Double(tempString) ?? 0
            x /= 10000
            return x
        }
        else{
            return nil
        }
        
    }
    func configureRangeSlider(){
        rangeSlider.lowerValue = checkSalary(salary: HomeViewController.filterParams[5]) ?? 0
        rangeSlider.upperValue = checkSalary(salary: HomeViewController.filterParams[6]) ?? 1
        rangeSlider.addTarget(self, action: #selector(rangeSliderValueChanged),
                                 for: .valueChanged)
    }
    func setup(){
        tap.addTarget(self, action: #selector(closeInputView))
        self.view.addGestureRecognizer(tap)
        configureRangeSlider()
        lowerSum.text = String(Int(10000 * rangeSlider.lowerValue) / 100 * 100) + " cмн"
        upperSum.text = String(Int((10000 * rangeSlider.upperValue + 99)) / 100 * 100) + " cмн"
        cityPicker.delegate = self
        cityPicker.dataSource = self
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        experiencePicker.delegate = self
        experiencePicker.dataSource = self
        scheduleTypePicker.delegate = self
        scheduleTypePicker.dataSource = self
        cityPicker.delegate = self
        cityPicker.dataSource = self
        cityTextField.inputView = cityPicker
        categoryTextField.inputView = categoryPicker
        scheduleTypeTextField.inputView = scheduleTypePicker
        experienceTextField.inputView = experiencePicker
        rangeSliderView.layer.cornerRadius = 8
        bottomSheetView.layer.cornerRadius = 12
    }
    
    @IBAction func showVacancies(_ sender: Any) {
        filterDelegate.didChange()
        self.dismiss(animated: true )
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
extension HomeBottomSheetViewController{
    @objc func closeInputView(){
        categoryTextField.resignFirstResponder()
        cityTextField.resignFirstResponder()
        experienceTextField.resignFirstResponder()
        scheduleTypeTextField.resignFirstResponder()    
    }
    @objc func rangeSliderValueChanged(){
        HomeViewController.filterParams[5] = ""
        HomeViewController.filterParams[6] = ""
        lowerSum.text = String(Int(10000 * rangeSlider.lowerValue) / 100 * 100)
        upperSum.text = String(Int((10000 * rangeSlider.upperValue + 99)) / 100 * 100)
        if lowerSum.text != "0"{
            HomeViewController.filterParams[5] = "&salary_min=" + lowerSum.text!
        }
        if upperSum.text != "10000"{
            HomeViewController.filterParams[6] = "&salary_max=" + upperSum.text!
        }
        lowerSum.text = String(Int(10000 * rangeSlider.lowerValue) / 100 * 100) + " cмн"
        upperSum.text = String(Int((10000 * rangeSlider.upperValue + 99)) / 100 * 100) + " cмн"
    }
}
extension HomeBottomSheetViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView{
        case cityPicker:
            return StaticData.cities.count
        case categoryPicker:
            return StaticData.categories.count
        case scheduleTypePicker:
            return StaticData.scheduleTypes.count
        default:
            return StaticData.experiences.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView{
        case cityPicker:
            return StaticData.cities[row].nameRu
        case categoryPicker:
            return StaticData.categories[row].name
        case scheduleTypePicker:
            return StaticData.scheduleTypes[row].name
        default:
            return StaticData.experiences[row].name
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView{
        case cityPicker:
            if row == 0{
                HomeViewController.filterParams[1] = ""
            }
            else{
                HomeViewController.filterParams[1] = "&city_id=\(StaticData.cities[row].id)"
            }
            cityTextField.text =  StaticData.cities[row].nameRu
        case categoryPicker:
            if row == 0{
                HomeViewController.filterParams[2] = ""
            }
            else{
                HomeViewController.filterParams[2] = "&category_id=\(StaticData.categories[row].id)"
            }
            categoryTextField.text = StaticData.categories[row].name
        case scheduleTypePicker:
            if row == 0{
                HomeViewController.filterParams[3] = ""
            }
            else{
                HomeViewController.filterParams[3] = "&schedule_type_id=\(StaticData.scheduleTypes[row].id)"
            }
        default:
            if row == 0{
                HomeViewController.filterParams[4] = ""
            }
            else{
                HomeViewController.filterParams[4] = "&experience_id=\(StaticData.experiences[row].id)"
            }
        }
    }
    
}
