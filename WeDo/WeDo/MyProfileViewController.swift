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
    
    @IBOutlet weak var editBtn: UIBarButtonItem!
    @IBOutlet weak var emailPencilBtn: UIButton!
    @IBOutlet weak var contactPencilBtn: UIButton!
    @IBOutlet weak var messagePencilBtn: UIButton!
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var messageTextField: UITextField!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        emailPencilBtn.isHidden = true
        contactPencilBtn.isHidden = true
        messagePencilBtn.isHidden = true
        
        
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


