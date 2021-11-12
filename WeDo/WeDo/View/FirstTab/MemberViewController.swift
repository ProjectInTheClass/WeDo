//
//  MemberViewController.swift
//  WeDo
//
//  Created by 윤영서 on 2021/10/21.
//

import UIKit
import Alamofire

class CustomTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    //사진, title 일정 사이즈로 fix
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.frame = CGRect(x: 10,y: 0,width: 40,height: 40)
        self.textLabel?.frame = CGRect(x: 60, y: 10, width: self.frame.width - 45, height: 20)
    }
}



class MemberViewController: UITableViewController {
    
    @IBOutlet weak var settingBtn: UIBarButtonItem!

    
    
    
    
//    var members: [divideSection] = [
//        divideSection(sectionName: "나", sectionObject: [Member(name: "김토니", image: "dog", email: "vkennerley0@howstuffworks.com", contact: "010-1234-5678", profileMessage: "안녕하세요")
//                                                        ]),
//        divideSection(sectionName: "멤버", sectionObject:
//              [Member(name: "김춘삼", image: "cat", email: "rhanratty1@sina.com", contact: "010-4543-4343", profileMessage: "안녕하세요2"),
//              Member(name: "김춘식", image: "raccoon", email: "kbeere2@wp.com", contact: "010-3322-3322", profileMessage: "안냥"),
//              Member(name: "박삼식", image: "goat", email: "jshoppee3@blogspot.com", contact: "010-3303-3303", profileMessage: "안녕하세요3"),
//              Member(name: "조덕배", image: "panda", email: "cgreenside5@apple.com", contact: "010-2182-3822", profileMessage: "안녕하셍ㄷ"),
//              Member(name: "이수지", image: "tiger", email: "agladtbach6@dagondesign.com", contact: "010-9665-5945", profileMessage: "ㄴ엉"),
//               Member(name: "현계림", image: "zebra", email: "agoudy11@examiner.com", contact: "010-3943-5885", profileMessage: "ㄴ어")
//              ])
//    ]
 
    var members: [Member] = [
        Member(name: "김토니", image: "dog", email: "vkennerley0@howstuffworks.com", contact: "010-1234-5678", profileMessage: "안녕하세요"),
        Member(name: "김춘삼", image: "cat", email: "rhanratty1@sina.com", contact: "010-4543-4343", profileMessage: "안녕하세요2"),
        Member(name: "김춘식", image: "raccoon", email: "kbeere2@wp.com", contact: "010-3322-3322", profileMessage: "안냥"),
        Member(name: "박삼식", image: "goat", email: "jshoppee3@blogspot.com", contact: "010-3303-3303", profileMessage: "안녕하세요3"),
        Member(name: "조덕배", image: "panda", email: "cgreenside5@apple.com", contact: "010-2182-3822", profileMessage: "안녕하셍ㄷ"),
        Member(name: "이수지", image: "tiger", email: "agladtbach6@dagondesign.com", contact: "010-9665-5945", profileMessage: "ㄴ엉"),
        Member(name: "현계림", image: "zebra", email: "agoudy11@examiner.com", contact: "010-3943-5885", profileMessage: "ㄴ어")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return members[section].sectionObject.count
        members.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: CustomTableViewCell = CustomTableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "myCell")
        cell.imageView!.layer.cornerRadius = 20
        cell.imageView!.clipsToBounds = true
        cell.imageView?.image = UIImage(contentsOfFile: members[indexPath.row].image)
        cell.textLabel?.text = members[indexPath.row].name
        cell.imageView?.image = UIImage(named: members[indexPath.row].image)
        return cell
    }
    
    
    
    
    var memberIndex = 0
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        memberIndex = indexPath.row
        performSegue(withIdentifier: "myProfileSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "myProfileSegue") {
            let receiverVC = segue.destination as! MyProfileViewController
            
            receiverVC.myName = members[memberIndex].name
            receiverVC.myImage = UIImage(named: members[memberIndex].image)
            receiverVC.myContact = members[memberIndex].contact
            receiverVC.myEmail = members[memberIndex].email
            receiverVC.myProfileMessage = members[memberIndex].profileMessage
            
        } else if (segue.identifier == "searchSegue") {
            let receiverVC = segue.destination as! SearchTableViewController
            
            receiverVC.searchMembers = members
            
        } else if (segue.identifier == "deleteSegue") {
            let receiverVC = segue.destination as! DeleteTableViewController
            
            receiverVC.deleteMembers = members
            
        }
        
    }
    
    
    
    
    @IBAction func settingButtonTapped(_ sender: Any) {
        showActionsheet()
    }
    

    
    
    
    
    func showActionsheet() {
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "취소", style: .cancel, handler: { action in
        }))
        
        actionSheet.addAction(UIAlertAction(title: "멤버삭제", style: .default, handler: { action in
            
            self.performSegue(withIdentifier: "deleteSegue", sender: actionSheet)
//            self.tableView.isEditing = !self.tableView.isEditing
//
//            if self.tableView.isEditing {
//
//                self.navigationItem.rightBarButtonItem! = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: nil)
//            } else {
//
//                self.navigationItem.rightBarButtonItem! = UIBarButtonItem(title: "Edit", style: UIBarButtonItem.Style.plain, target: self, action: nil)
//            }
            


        }))
        
        actionSheet.addAction(UIAlertAction(title: "전체설정", style: .default, handler: { action in
        }))
        
 
        present(actionSheet, animated: true)
    }
    
    
    
    
    
    func editButtonPressed(_ sender: Any) {
        if tableView.isEditing {
            tableView.setEditing(false, animated: true)
            self.navigationItem.rightBarButtonItem!.title = "Edit"
        } else {
            tableView.setEditing(true, animated: true)
            self.navigationItem.rightBarButtonItem!.title = "Done"
        }
    }
    
}
