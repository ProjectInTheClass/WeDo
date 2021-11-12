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
    @IBOutlet weak var timePickerView: UIDatePicker!
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var dateBtn: UIButton!
    @IBOutlet weak var timeBtn: UIButton!
    @IBOutlet weak var dateSwitch: UISwitch!
    @IBOutlet weak var timeSwitch: UISwitch!
    @IBOutlet weak var selectedDateLabel: UILabel!
    @IBOutlet weak var selectedTimeLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePickerView.isHidden = true
        datePickerView.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
        dateSwitch.isOn = false
        dateBtn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        
        
        
        timeSwitch.isOn = false
        timeBtn.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        timePickerView.isHidden = true
        timePickerView.addTarget(self, action: #selector(timeSelected), for: .valueChanged)
        
        
        
        
        if isDateSwitchOn == false {
            dateBtn.isEnabled = false
        } else {
            dateBtn.isEnabled = true
        }
        
        if isTimeSwitchOn == false {
            timeBtn.isEnabled = false
        } else {
            timeBtn.isEnabled = true
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
            
            timeBtn.isHidden = true
            timeSwitch.isHidden = true

        } else {
            if selectedDateLabel.text != "" {
                dateBtn.isEnabled = true
            }
            selectedDateLabel.text = ""
            dateBtn.isEnabled = false
            datePickerView.isHidden = true
            
            timeBtn.isHidden = false
            timeSwitch.isHidden = false
        }
    }
    
    var isTimeSwitchOn:Bool = false
    @IBAction func timePickerSwitchOnOff(_ sender: Any) {
        isTimeSwitchOn = !isTimeSwitchOn
        if isTimeSwitchOn == true {
            timeBtn.isEnabled = true
            timePickerView.isHidden = false
        } else {
            if selectedTimeLabel.text != "" {
                timeBtn.isEnabled = true
            }
            selectedTimeLabel.text = ""
            timeBtn.isEnabled = false
            timePickerView.isHidden = true
        }
    }
    
    
    
    
    
    
    
    var showCalender:Bool = false
    @IBAction func dateBtnTapped(_ sender: Any) {
        showCalender = !showCalender
        if showCalender == true {
            datePickerView.isHidden = false
            
            timeBtn.isHidden = true
            timeSwitch.isHidden = true
        } else {
            datePickerView.isHidden = true
            
            timeBtn.isHidden = false
            timeSwitch.isHidden = false

        }

    }
    
    
    
    
    
    
    @objc
    func dateSelected() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let date = dateFormatter.string(from: datePickerView.date)
        selectedDateLabel.text = date
    }
    
    @objc
    func timeSelected() {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .none
        let time = timeFormatter.string(from: timePickerView.date)
        selectedTimeLabel.text = time
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
