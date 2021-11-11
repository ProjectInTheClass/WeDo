//
//  DeleteTableViewController.swift
//  WeDo
//
//  Created by 윤영서 on 2021/11/08.
//

import UIKit

class DeleteTableViewCell: UITableViewCell {

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



class DeleteTableViewController: UITableViewController, UISearchBarDelegate {
    

    var deleteMembers: [Member] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.isEditing = true
    }


    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deleteMembers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
        let cell: DeleteTableViewCell = DeleteTableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "myDeleteCell")
        
        cell.imageView!.layer.cornerRadius = 20
        cell.imageView!.clipsToBounds = true
        cell.textLabel?.text = deleteMembers[indexPath.row].name
        cell.imageView?.image = UIImage(named: deleteMembers[indexPath.row].image)

        return cell
    }
    
    
    var memberIndex = 0
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete ) {
            
            print("멤버삭제, 남은 멤버: \(deleteMembers.count)")
            
            self.deleteMembers.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
         }
    }
}
