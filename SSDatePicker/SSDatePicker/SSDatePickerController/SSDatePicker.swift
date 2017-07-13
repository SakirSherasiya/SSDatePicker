//
//  SSDatePicker.swift
//  SSDatePicker
//
//  Created by Sakir Sherasiya on 08/07/17.
//  Copyright © 2017 Sakir Sherasiya. All rights reserved.
//

import UIKit

class SSDatePicker: UIViewController{
    
    var defaultDate: Date!
    var strFormat = String()
    
    var datePicker = SSPicker()
    public typealias completionHandler = (Date,String) -> Void
    var callBack: completionHandler?
    
    
    init(Frame: CGRect) {
        super.init(nibName: nil, bundle: nil)
        self.view.frame = Frame
        self.datePicker.frame = Frame
    }
    
    private func setFormat() -> [Int] {
        if strFormat == "" {
            return [0,1,2]
        }else{
            let tempArr = SSDatePickerView.shared.ssDatePicker.strFormat.components(separatedBy: "-")
            var arr = [Int]()
            for temp in tempArr {
                if temp == "dd" || temp == "DD"{
                    arr.append(0)
                }else if temp == "MM" || temp == "MMM" || temp == "mm" || temp == "mmm"{
                    if temp == "MM" || temp == "mm"{
                        datePicker.isMonthNameMode = false
                    }else{
                        datePicker.isMonthNameMode = true
                    }
                    arr.append(1)
                }
                else if temp == "yyyy" || temp == "YYYY"{
                    arr.append(2)
                }
            }
            if arr.count == 0 {
                return [0,1,2]
            }
            return arr
        }
    }
    
    func loadDatePicker() {
        setDefault()
    }
    
    private func setDefault(){
        self.datePicker.selectedYear = setDefaultDate(format: "YYYY")
        self.datePicker.selectedMonth = setDefaultDate(format: "MM")
        self.datePicker.selectedDay = setDefaultDate(format: "dd")
        self.datePicker.Format = setFormat()
        self.datePicker.setDatePicker()
        self.view.addSubview(datePicker)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func setDefaultDate(format: String) -> Int {
        if self.defaultDate == nil {
            self.defaultDate = Date()
        }
        return Int(getYYYYFormat(format: format).trimmingCharacters(in: .whitespaces))!
        
    }
    
    private func getYYYYFormat(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        let timeStamp = dateFormatter.string(from: defaultDate)
        return timeStamp
    }
    
    func clickOnbtn(_ sender: UIButton) {
        let returnDateFormat = datePicker.stringToDate(Format: datePicker.CheckFormat(), sday: 5775)
        let reDate = datePicker.ChangeDateFormat(today: returnDateFormat, Format: datePicker.CheckFormat())
        
        if sender.tag == 1 {
            callBack!(reDate,returnDateFormat)
        }else{
            callBack!(Date(),"")
        }
    }

}
