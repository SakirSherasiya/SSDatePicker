#Description
-SSDatePicker is like native UIDatePicker. 
-SSDatePicker help to set Format of DatePicker as you want set


#How to use SSDatePicker
For show datepicker in your viewController just type below code:
  SSDatePickerView.shared.showDatePicker(superc: self) { (date, str) in
    //CompletionHandler Of DatePicker            
  }

#set Format of SSDatePicker
First set format of datePicker then execute SSDatepicker show method

  SSDatePickerView.shared.format = "yyyy-MMM-dd"
  
  below Format you can use in datePicker
  
#set Default date in datePicker
Firsr set default date in datePicker then execute SSDatePicker show method
  SSDatePickerView.shared.defaultDate = dateObject


  
