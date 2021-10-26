//
//  MemberViewController.swift
//  WeDo
//
//  Created by 윤영서 on 2021/10/21.
//

import UIKit


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



class MemberViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var members: [Member] = [
        Member(name: "김토니", image: "dog", email: "vkennerley0@howstuffworks.com    ", contact: "010-1234-5678", profileMessage: "안녕하세요"),
        Member(name: "김춘삼", image: "cat", email: "rhanratty1@sina.com", contact: "010-4543-4343", profileMessage: "안녕하세요2"),
        Member(name: "김춘식", image: "raccoon", email: "kbeere2@wp.com", contact: "010-3322-3322", profileMessage: "안냥"),
        Member(name: "박삼식", image: "goat", email: "jshoppee3@blogspot.com", contact: "010-3303-3303", profileMessage: "안녕하세요3"),
        Member(name: "조덕배", image: "panda", email: "cgreenside5@apple.com", contact: "010-2182-3822", profileMessage: "안녕하셍ㄷ"),
        Member(name: "이수지", image: "tiger", email: "agladtbach6@dagondesign.com", contact: "010-9665-5945", profileMessage: "ㄴ엉"),
        Member(name: "현계림", image: "zebra", email: "agoudy11@examiner.com", contact: "010-3943-5885", profileMessage: "ㄴ어")
    ]
    
    
    
    var filteredData: [Member]!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self

        filteredData = members
    }
    


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: CustomTableViewCell = CustomTableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "myCell")
        cell.imageView!.layer.cornerRadius = 20
        cell.imageView!.clipsToBounds = true
        cell.imageView?.image = UIImage(contentsOfFile: members[indexPath.row].image)
//        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = filteredData[indexPath.row].name
        cell.imageView?.image = UIImage(named: filteredData[indexPath.row].image)
        return cell
    }
    
    
    
    
    var memberIndex = 0
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        memberIndex = indexPath.row
        performSegue(withIdentifier: "myProfileSegue", sender: self)
    }
    
    
    //멤버 데이터 다음 화면으로 패스
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "myProfileSegue") {
            let receiverVC = segue.destination as! MyProfileViewController
            
            receiverVC.myName = filteredData[memberIndex].name
            receiverVC.myImage = UIImage(named: filteredData[memberIndex].image)
            receiverVC.myContact = filteredData[memberIndex].contact
            receiverVC.myEmail = filteredData[memberIndex].email
            receiverVC.myProfileMessage = filteredData[memberIndex].profileMessage
            

        }
    }
    
    
    //검색기능
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []
        
        if searchText == "" {
            filteredData = members
        } else {
            for member in members {
                if member.name.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(member)
                }
            }
        }
        
        self.tableView.reloadData()
    }
    
    @IBAction func settingButtonTapped(_ sender: Any) {
        showActionsheet()
        

    }
    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {

            print("멤버 삭제 전")
            members.remove(at: indexPath.item)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            print("멤버 삭제 후")

        }
    }
    
    
    func showActionsheet() {
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "취소", style: .cancel, handler: { action in
        }))
        
        actionSheet.addAction(UIAlertAction(title: "멤버삭제", style: .default, handler: { action in
            print("멤버삭제 들어옴")
            self.tableView.isEditing = true
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "전체설정", style: .default, handler: { action in
        }))
        
 
        present(actionSheet, animated: true)
    }
    
}

