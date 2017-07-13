//
//  SSDatePickerButton.swift
//  SSDatePicker
//
//  Created by Sakir Sherasiya on 11/07/17.
//  Copyright © 2017 Sakir Sherasiya. All rights reserved.
//

import UIKit

class SSDatePickerButton: UIView {

    var btnCancle: UIButton!
    var btnDone: UIButton!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
        setButton()
    }
    
    func setButton(){
        btnCancle = UIButton(frame: CGRect(x: 0, y: 0, width: 145, height: 45))
        btnDone = UIButton(frame: CGRect(x: 155, y: 0, width: 145, height: 45))
        
        btnDone.setTitle("Done", for: .normal)
        btnCancle.setTitle("Cancel", for: .normal)
        
        btnDone.setTitleColor(UIColor.white, for: .normal)
        btnCancle.setTitleColor(UIColor.white, for: .normal)
        
        btnDone.layer.cornerRadius = 10.0
        btnCancle.layer.cornerRadius = 10.0
        
        btnDone.contentMode = .center
        btnCancle.contentMode = .center
        
        btnCancle.backgroundColor = UIColor.gray
        btnDone.backgroundColor = UIColor.gray
        
        btnCancle.tag = 0
        btnDone.tag = 1
        
        addSubview(btnCancle)
        addSubview(btnDone)
        
    }
    
    func clicked()  {
        print("Finally")
    }
    
    func clickedee()  {
        print("Finally")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
