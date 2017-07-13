//
//  SSPicker.swift
//  SSDatePicker
//
//  Created by Sakir Sherasiya on 08/07/17.
//  Copyright © 2017 Sakir Sherasiya. All rights reserved.
//

import UIKit

class SSPicker: UIPickerView,UIPickerViewDelegate,UIPickerViewDataSource {
    var day = [Int]()
    var month = [Any]()
    var year = [Int]()
    var Format = [Int]()
    var selectedYear: Int!
    var selectedDay: Int!
    var selectedMonth: Int!
    var isMonthNameMode : Bool = false
    var isTodayindex = 5775
 
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if Format[component] == 0{
            return day.count
        }else if Format[component] == 1{
            return month.count
        }else if Format[component] == 2{
            return year.count
        }
        return 0
        
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Format.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if Format[component] == 0{
            if isTodayindex != 5775 && isTodayindex == row+1{
                return "Today"
            }
            return String(format:"%02d",day[row])
        }else if Format[component] == 1{
            if isMonthNameMode {
                return String(format:"%@",month[row] as! CVarArg)
            }else{
                return String(format:"%02d",month[row] as! CVarArg)
            }
        }else if Format[component] == 2{
            return String(format:"%04d",year[row])
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if Format[component] == 0{
            selectedDay = day[row]
        }else if Format[component] == 1{
            selectedMonth = row + 1
            setDays()
        }else if Format[component] == 2{
            selectedYear = year[row]
            if year[100] >= selectedYear || year[900] <= selectedYear {
                setYear()
                self.reloadComponent(Format[component])
                self.selectRow(GetIndex(index: component), inComponent: component, animated: false)
            }
            setDays()
        }
    }
    
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
