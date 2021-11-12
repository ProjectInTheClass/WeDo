//
//  ToDoViewController.swift
//  WeDo
//
//  Created by 윤영서 on 2021/11/13.
//

import UIKit




class ToDoViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var dateSwitch: UISwitch!
    @IBOutlet weak var selectedDateLabel: UILabel!
    @IBOutlet weak var dateBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePickerView.isHidden = true
        datePickerView.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
        dateSwitch.isOn = false
        dateBtn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        
        if isDateSwitchOn == false {
            dateBtn.isEnabled = false
        } else {
            dateBtn.isEnabled = true
        }
        
        
        titleTextView.delegate = self
        bodyTextView.delegate = self
        
        titleTextView.layer.cornerRadius = 5
        titleTextView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        titleTextView.text = "제목"
        titleTextView.textColor = UIColor.lightGray
        
        
        bodyTextView.layer.cornerRadius = 5
        bodyTextView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        bodyTextView.text = "내용"
        bodyTextView.textColor = UIColor.lightGray
        
        self.hideKeyboardWhenTappedAround()


    }
    
    var isDateSwitchOn:Bool = false
    @IBAction func datePickerSwitchOnOff(_ sender: UISwitch) {
        isDateSwitchOn = !isDateSwitchOn
        if isDateSwitchOn == true {
            dateBtn.isEnabled = true
            datePickerView.isHidden = false
        } else {
            if selectedDateLabel.text != "" {
                dateBtn.isEnabled = true
            }
            selectedDateLabel.text = ""
            dateBtn.isEnabled = false
            datePickerView.isHidden = true
        }
    }
    
    var showCalender:Bool = false
    @IBAction func dateBtnTapped(_ sender: Any) {
        showCalender = !showCalender
        if showCalender == true {
            datePickerView.isHidden = false
        } else {
            datePickerView.isHidden = true
        }

    }
    
    
    
    
    
    
    @objc
    func dateSelected() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let date = dateFormatter.string(from: datePickerView.date)
        selectedDateLabel.text = date
    }
    
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
                textView.text = nil
                textView.textColor = UIColor.black
            }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if titleTextView.text.isEmpty {
            textView.text = "제목"
            textView.textColor = UIColor.lightGray
        } else if bodyTextView.text.isEmpty {
            textView.text = "내용"
            textView.textColor = UIColor.lightGray
        } else {
            textView.textColor = UIColor.black
        }
    }
    


}
