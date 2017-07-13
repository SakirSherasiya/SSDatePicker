//
//  SSDatePickerView.swift
//  SSDatePicker
//
//  Created by Sakir Sherasiya on 10/07/17.
//  Copyright © 2017 Sakir Sherasiya. All rights reserved.
//

import UIKit

class SSDatePickerView: UIViewController {
    
    var ssDatePicker: SSDatePicker!
    var ssButton: SSDatePickerButton!
    var blurView: UIVisualEffectView!
    var reSuper: UIViewController!
    var defaultDate = Date()
    var format = String()
    
    
    
    // MARK: Shared Instance
    static var shared = SSDatePickerView()
    private init() {
        super.init(nibName: nil, bundle: nil)
        let center = UIApplication.shared.windows[0].frame.size
        view.frame = CGRect(x: center.width/2-160, y: center.height/2-180, width: 320, height: 360)
        view.layer.cornerRadius = 20.0
        view.backgroundColor = UIColor(red: 0, green: 238, blue: 238, alpha: 1.0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setButton()  {
        let frame = CGRect(x: 10, y: 305, width: 300, height: 50)
        ssButton = SSDatePickerButton(frame: frame)
        ssButton.btnDone.addTarget(ssDatePicker, action: #selector(ssDatePicker.clickOnbtn(_:)), for: .touchUpInside)
        ssButton.btnCancle.addTarget(ssDatePicker, action: #selector(ssDatePicker.clickOnbtn(_:)), for: .touchUpInside)
        ssButton.btnDone.addTarget(self, action: #selector(removeFromSuperView), for: .touchUpInside)
        ssButton.btnCancle.addTarget(self, action: #selector(removeFromSuperView), for: .touchUpInside)
        view.addSubview(ssButton)
    }
    
    func removeFromSuperView()  {
        view.removeFromSuperview()
        blurView.removeFromSuperview()
        ssButton.removeFromSuperview()
        ssDatePicker.view.removeFromSuperview()
        
    }
    
    func blurBackView(superc: UIViewController) -> UIView {
        let backFrame = superc.view.bounds
        blurView = UIVisualEffectView(frame: backFrame)
        let blurEffect = UIBlurEffect(style: .dark)
        blurView.alpha = 0.45
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.effect = blurEffect
        return blurView
    }
    
    func AddControllerToSuperView(superc: UIViewController) {
        superc.addChildViewController(self)
    }
    
    func setDatePicker(){
        
        let  Frame = CGRect(x: 10, y: 0, width: 300, height: 300)
        ssDatePicker = SSDatePicker(Frame: Frame)
        ssDatePicker.strFormat = format
        ssDatePicker.defaultDate = defaultDate
        ssDatePicker.loadDatePicker()
        view.addSubview(ssDatePicker.view)
    }
    
    func showDatePicker(superc: UIViewController, completionHandler:@escaping (Date,String) -> Void)  {
        AddControllerToSuperView(superc: superc)
        superc.view.addSubview(blurBackView(superc: superc))
        setDatePicker()
        setButton()
        superc.view.addSubview(view)
        ssDatePicker.callBack = completionHandler
    }
    
    
}
