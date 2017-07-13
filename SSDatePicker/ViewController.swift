//
//  ViewController.swift
//  SSDatePicker
//
//  Created by Sakir Sherasiya on 08/07/17.
//  Copyright © 2017 Sakir Sherasiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor.red
        let ui = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
        ui.backgroundColor = UIColor.yellow
        view.addSubview(ui)
        
        SSDatePickerView.shared.format = "yyyy-dd-MMM"
        
        SSDatePickerView.shared.showDatePicker(superc: self) { (date, str) in
            
        }
        
        let Uibutton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        Uibutton.setTitle("show", for: .normal)
        Uibutton.setTitleColor(UIColor.black, for: .normal)
        Uibutton.addTarget(self, action: #selector(clicked), for: .touchUpInside)
        
        view.addSubview(Uibutton)
        
        
    }
    func clicked() {
        SSDatePickerView.shared.showDatePicker(superc: self) { (date, str) in
            
        }
        print("clicked")
    }




}

