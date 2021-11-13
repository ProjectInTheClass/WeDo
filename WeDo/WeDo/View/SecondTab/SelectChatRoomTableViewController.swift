//
//  SelectChatRoomTableViewController.swift
//  WeDo
//
//  Created by 윤영서 on 2021/11/12.
//

import UIKit

class SelectChatRoomTableViewController: UITableViewController {
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "김춘삼"
        return cell
    }
    
    var chattingRoomIndex = 0
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chattingRoomIndex = indexPath.row
        performSegue(withIdentifier: "chattingRoom", sender: self)
    }
    
    
    
    @IBAction func settingBtnTapped(_ sender: Any) {
        showActionsheet()
    }
    
    
    

    func showActionsheet() {
        
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "취소", style: .cancel, handler: { action in
        }))
        
        actionSheet.addAction(UIAlertAction(title: "채팅창삭제", style: .default, handler: { action in
            
            self.performSegue(withIdentifier: "deleteChatSegue", sender: actionSheet)

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
