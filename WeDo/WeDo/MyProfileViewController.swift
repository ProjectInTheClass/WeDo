//
//  MyProfileViewController.swift
//  WeDo
//
//  Created by 윤영서 on 2021/10/21.
//

import UIKit

    
// ---- 데이터 마련되면 다시 진행할 작업
class MyProfileViewController: UIViewController {

    var myName: String?
    var myImage: UIImage?
    var myEmail: String?
    var myContact: String?
    var myProfileMessage: String?
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileEmailLabel: UILabel!
    @IBOutlet weak var profileContactLabel: UILabel!
    @IBOutlet weak var profileMessageLabel: UILabel!
    
    @IBOutlet weak var emailEditBtn: UIButton!
    @IBOutlet weak var contactEditBtn: UIButton!
    @IBOutlet weak var messageEditBtn: UIButton!
    @IBOutlet weak var emailEditConfirmBtn: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactEditBtn.isHidden = true
        messageEditBtn.isHidden = true
        emailTextField.isHidden = true
        emailEditBtn.isHidden = true
        emailEditConfirmBtn.isHidden = true
        emailTextField.isHidden = true

        

        profileImageView.image = myImage
        profileNameLabel.text = myName
        profileEmailLabel.text = myEmail
        profileContactLabel.text = myContact
        profileMessageLabel.text = myProfileMessage
    }
    
    
    @IBAction func editButtonPressed(_ sender: Any) {
        
        emailEditBtn.isHidden = false
        contactEditBtn.isHidden = false
        messageEditBtn.isHidden = false
    }
    
    
    @IBAction func editEmailButtonPressed(_ sender: Any) {
        
        emailTextField.isHidden = false
        emailEditBtn.isHidden = true
        profileEmailLabel.isHidden = true
        emailEditConfirmBtn.isHidden = false
        emailTextField.text = "\(myEmail!)"
    }
    
    
    
    @IBAction func emailEditConfirmBtnPressed(_ sender: Any) {
        
        myEmail = emailTextField.text
        profileEmailLabel.text = "\(myEmail!)"
        emailEditConfirmBtn.isHidden = true
        emailEditBtn.isHidden = false
        emailTextField.isHidden = true
        profileEmailLabel.isHidden = false
    }
    

    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}


