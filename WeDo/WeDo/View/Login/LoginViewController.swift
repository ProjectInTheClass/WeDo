//
//  LoginViewController.swift
//  WeDo
//
//  Created by 최형민 on 2021/11/05.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginBtnTap(_ sender: Any) {
        let idAlert = UIAlertController(title: nil, message: "아이디를 입력해주세요", preferredStyle: .alert)
        
        let passwordAlert = UIAlertController(title: nil, message: "비밀번호를 입력해주세요", preferredStyle: .alert)
        
        guard let id = idTextField.text, !id.isEmpty else {
            present(idAlert, animated: true, completion: nil)
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            present(passwordAlert, animated: true, completion: nil)
            return
        }
        
        let params = LogInRequest(password: password, userid: id)
        LogInDataManager().self.postLogIn(params, delegate: self)
        UserDefaults.standard.set(id, forKey: "userid")
        UserDefaults.standard.set(password, forKey: "password")
    }
    
    let sucAlert = UIAlertController(title: nil, message: "로그인에 성공하였습니다", preferredStyle: .alert)
}

extension LoginViewController {
    
    func didSuccessSignIn(_ result: LogInResult) {
        UserDefaults.standard.string(forKey: "auth-token")
        UserDefaults.standard.string(forKey: "userid")
    
        let storyboardVC = UIStoryboard(name: "Main", bundle: Bundle(for: MemberViewController.self)).instantiateViewController(withIdentifier: "MemberViewController")
        
        self.dismiss(animated: true) {
            self.present(storyboardVC, animated: true, completion: nil)
        }
    }
    
    func failedToRequest(message: String) {
        UserDefaults.standard.removeObject(forKey: "userid")
        UserDefaults.standard.removeObject(forKey: "password")
    }
}
