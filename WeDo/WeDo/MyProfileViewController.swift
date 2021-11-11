//
//  MyProfileViewController.swift
//  WeDo
//
//  Created by 윤영서 on 2021/10/21.
//

import UIKit


//extension UIImage { func resize(newWidth: CGFloat) -> UIImage {
//    let scale = newWidth / self.size.width
//    let newHeight = self.size.height * scale
//    let size = CGSize(width: newWidth, height: newHeight)
//    let render = UIGraphicsImageRenderer(size: size)
//    let renderImage = render.image { context in self.draw(in: CGRect(origin: .zero, size: size)) }
//    return renderImage
//    }
//}
    

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
        // Do any additional setup after loading the view.
        
        
        contactEditBtn.isHidden = true
        messageEditBtn.isHidden = true
        emailTextField.isHidden = true
        emailEditBtn.isHidden = true
        emailEditConfirmBtn.isHidden = true
        emailTextField.isHidden = true
        contactTextField.isHidden = true
        messageTextField.isHidden = true

    
        
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
        
        
        self.isEditing = !self.isEditing
        
        if self.isEditing {
            editBtn.title = "완료"
            
            emailTextField.isHidden = false
            profileEmailLabel.isHidden = true
            
            contactTextField.isHidden = false
            profileContactLabel.isHidden = true
            
            messageTextField.isHidden = false
            profileMessageLabel.isHidden = true
            
            
            
            emailTextField.text = "\(myEmail!)"
            contactTextField.text = "\(myContact!)"
            messageTextField.text = "\(myProfileMessage!)"
            
            emailPencilBtn.isHidden = false
            contactPencilBtn.isHidden = false
            messagePencilBtn.isHidden = false

            
        } else {
            editBtn.title = "편집"
            myEmail = emailTextField.text
            myContact = contactTextField.text
            myProfileMessage = messageTextField.text

            profileEmailLabel.text = "\(myEmail!)"
            profileContactLabel.text = "\(myContact!)"
            profileMessageLabel.text = "\(myProfileMessage!)"
            
            
            
            emailTextField.isHidden = true
            profileEmailLabel.isHidden = false
            
            contactTextField.isHidden = true
            profileContactLabel.isHidden = false
            
            messageTextField.isHidden = true
            profileMessageLabel.isHidden = false
            
            
            
            emailPencilBtn.isHidden = true
            contactPencilBtn.isHidden = true
            messagePencilBtn.isHidden = true
        }
    }
}


