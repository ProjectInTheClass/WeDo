//
//  ChatRoomViewController.swift
//  WeDo
//
//  Created by 윤영서 on 2021/11/12.
//

import UIKit


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self,action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
        view.frame.origin.y = 0

    }
}

class ChatRoomViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var todoBtn: UIButton!
    @IBOutlet weak var checklistBtn: UIButton!
    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTextField.delegate = self

        
        todoBtn.isHidden = true
        checklistBtn.isHidden = true
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

        self.hideKeyboardWhenTappedAround()
    }
    
    
//    이 부분과 아래 부분이 안 먹히는 것 같음 => 임시로 다른 함수 추가해 리턴시 돌아가게 했지만 다른해결 필요
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        view.frame.origin.y = 0
        return false
    }

    
    var moveBtnPressed: Bool = false
    @IBAction func plusBtnTapped(_ sender: UIButton) {
        
        moveBtnPressed = !moveBtnPressed
        
        if moveBtnPressed {
            todoBtn.isHidden = false
            checklistBtn.isHidden = false
            
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
                self.todoBtn.alpha = 1.0
                self.checklistBtn.alpha = 1.0
                self.todoBtn.frame.origin.y -= 55
                self.checklistBtn.frame.origin.y -= 110
            }, completion: nil)
            
        } else {
            
            DispatchQueue.global().sync {
                UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseOut, animations: {
                    self.todoBtn.alpha = 0.0
                    self.checklistBtn.alpha = 0.0
                    self.todoBtn.frame.origin.y += 55
                    self.checklistBtn.frame.origin.y += 110
                }) {
                    finished in
                    self.todoBtn.isHidden = true
                    self.checklistBtn.isHidden = true
                }
            }
        }
    }
    
    @objc func keyboardWillChange(notification: Notification) {

        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }


        // 안되는 부분 유추
        if notification.name == UIResponder.keyboardWillShowNotification ||
            notification.name == UIResponder.keyboardWillHideNotification {

            view.frame.origin.y = -(keyboardRect.height - 70)
        } else {
            view.frame.origin.y = 0
        }
    }
    
}
    
    
    

