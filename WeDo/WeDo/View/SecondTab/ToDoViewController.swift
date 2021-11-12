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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    @IBAction func datePickerSwitchOnOff(_ sender: UISwitch) {
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
