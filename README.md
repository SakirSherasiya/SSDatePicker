# Description

-SSDatePicker is like native UIDatePicker. 

-SSDatePicker help to set Format of DatePicker as you want set


# How to use SSDatePicker

For show datepicker in your viewController just type below code:

  SSDatePickerView.shared.showDatePicker(superc: self) { (date, str) in
    //CompletionHandler Of DatePicker            
  }
  
  <img src="https://github.com/SakirSherasiya/SSDatePicker/blob/master/ScreenShot/Simulator%20Screen%20Shot%2014-Jul-2017,%2010.14.07%20AM.png" width="280" height ="475">


# set Format of SSDatePicker

First set format of datePicker then execute SSDatepicker show method

  SSDatePickerView.shared.format = "yyyy-MMM-dd"
  
  below Format you can use in datePicker
  
  "dd-MM-yyyy" , "dd-MMM-yyyy" in order which one you like.
 
  <img src="https://github.com/SakirSherasiya/SSDatePicker/blob/master/ScreenShot/Simulator%20Screen%20Shot%2014-Jul-2017,%2010.10.50%20AM.png" width="280" height ="475">
  
# set Default date in datePicker

Firsr set default date in datePicker then execute SSDatePicker show method
  SSDatePickerView.shared.defaultDate = dateObject

  <img src="https://github.com/SakirSherasiya/SSDatePicker/blob/master/ScreenShot/Simulator%20Screen%20Shot%2014-Jul-2017,%2010.14.07%20AM.png" width="280" height ="475">


  
