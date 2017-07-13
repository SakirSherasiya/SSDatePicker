//
//  SSDatePickerExtension.swift
//  SSDatePicker
//
//  Created by Sakir Sherasiya on 10/07/17.
//  Copyright © 2017 Sakir Sherasiya. All rights reserved.
//

import UIKit

extension SSPicker{
    func setDays() {
        isTodayindex = 5775
        let Today = Date()
        var ischeckfortoday = false
        let MM = ChangeDateFormatToString(today: Today, Format: "MM")
        let yyyy = ChangeDateFormatToString(today: Today, Format: "yyyy")
        if Int(MM) ==  selectedMonth {
            if Int(yyyy) == selectedYear {
                ischeckfortoday = true
            }
        }
        let dateComponents = DateComponents(year: self.selectedYear, month: self.selectedMonth)
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!
        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count
        self.day.removeAll()
        for i in 1...numDays {
            self.day.append(i)
            if  ischeckfortoday{
                if checkToday(sday: i) {
                    isTodayindex = i
                }
            }
        }
        var component = 0
        if Format.contains(where: { (check) -> Bool in
            
            if check == 0
            {
                return true
            }
            component = component + 1
            return false
        }){
            reloadComponent(component)
        }
    }
    
    func setMonth() {
        self.month.removeAll()
        let formatter = DateFormatter()
        let monthName = formatter.shortMonthSymbols
        if isMonthNameMode {
            self.month = monthName!
        }else{
            var i = 1
            for _ in monthName! {
                self.month.append(i)
                i = i + 1
            }
        }
        
    }
    
    func setYear() {
        year.removeAll()
        
        for i in self.selectedYear-500...self.selectedYear+500 {
            self.year.append(i)
        }
    }
    
    func setDatePicker() {
        setYear()
        setMonth()
        setDays()
        self.reloadAllComponents()
        dataSource = self
        delegate = self
        self.selectRow(GetIndex(index: 0), inComponent: 0, animated: true)
        self.selectRow(GetIndex(index: 1), inComponent: 1, animated: true)
        self.selectRow(GetIndex(index: 2), inComponent: 2, animated: true)
        
    }

    func checkToday(sday: Int) -> Bool {
        let Today = Date()
        let strFormat = CheckFormat()
        let Todaydate = ChangeDateFormatToString(today: Today, Format: strFormat)
        let selectDate = stringToDate(Format: strFormat, sday: sday)
        if selectDate == Todaydate {
            return true
        }
        return false
    }
    
    func GetIndex(index: Int) -> Int {
        var i = 0
        if Format[index] == 0 {
            for tempValue in day {
                if tempValue == selectedDay {
                    return i
                }
                i = i + 1
            }
        }else if Format[index] == 2 {
            for tempValue in year {
                if tempValue == selectedYear {
                    return i
                }
                i = i + 1
            }
        }else if Format[index] == 1{
            return selectedMonth-1
        }
        return 0
    }
    
    func CheckFormat() -> String {
        var strFormat = String()
        for i in 0...2 {
            if Format[i] == 0 {
                strFormat = strFormat + "dd"
            }else if Format[i] == 1{
                if isMonthNameMode {
                    strFormat = strFormat + "MMM"
                }else{
                    strFormat = strFormat + "MM"
                }
                
            }else if Format[i] == 2{
                strFormat = strFormat + "yyyy"
            }
            if i != 2 {
                strFormat = strFormat + "-"
            }
        }
        return strFormat
    }
    
    func ChangeDateFormat(today:String,Format: String) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Format
        let temp = dateFormatter.date(from: today)
        return temp!
    }
    func ChangeDateFormatToString(today:Date,Format: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Format
        dateFormatter.defaultDate = today
        return dateFormatter.string(from: today)
        
    }
    
    
    func stringToDate(Format: String,sday: Int) -> String {
        var dateString = String()
        if sday == 5775 {
            dateString = String(format:"%02d-%02d-%04d",selectedDay,selectedMonth,selectedYear)
        }else{
            dateString = String(format:"%02d-%02d-%04d",sday,selectedMonth,selectedYear)
        }
    
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        let dateObj = dateFormatter.date(from: dateString)
        dateFormatter.dateFormat = Format
        let temp = dateFormatter.string(from: dateObj!)
        return temp
    }
}
