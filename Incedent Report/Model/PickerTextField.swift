//
//  PickerTextField.swift
//  Incedent Report
//
//  Created by Matthew Elmore on 10/23/19.
//  Copyright © 2019 Matthew Elmore. All rights reserved.
//

import UIKit

class PickerTextField: UITextField, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var selectionItems: [String] = []
    var pickerView = UIPickerView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setDelegates()
    }
    
    func setDelegates() {
        pickerView.delegate = self
        self.inputView = pickerView
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return selectionItems.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return selectionItems[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.text = selectionItems[row]
//        self.resignFirstResponder()
    }
    
}
