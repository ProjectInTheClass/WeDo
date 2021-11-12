//
//  ChatRoomViewController.swift
//  WeDo
//
//  Created by 윤영서 on 2021/11/12.
//

import UIKit

class ChatRoomViewController: UIViewController {

    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var todoBtn: UIButton!
    @IBOutlet weak var checklistBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoBtn.isHidden = true
        checklistBtn.isHidden = true

        // Do any additional setup after loading the view.
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


//            let group = DispatchGroup()
//
//            group.enter()
//            UIView.animate(withDuration: 0.5, animations: {
//                self.todoBtn.frame.origin.y += 50
//                self.checklistBtn.frame.origin.y += 100
//            }, completion: nil)
//
//            group.leave()
//            group.notify(queue: .main){
//                self.todoBtn.isHidden = true
//                self.checklistBtn.isHidden = true
//            }
        }
        
        
    }
    
    
    
    
}
    
    
    

