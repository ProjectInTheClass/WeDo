//
//  SearchTableViewController.swift
//  WeDo
//
//  Created by 윤영서 on 2021/11/08.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

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



//class SearchTableViewController: UITableViewController, UISearchBarDelegate {
//
//
//    @IBOutlet weak var searchBar: UISearchBar!
//
//
//
//    var searchMembers: [Member] = []
//    var filteredData: [Member] = []
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        searchBar.delegate = self
//
//        filteredData = searchMembers
//    }
//
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return filteredData.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
////        let cell: SearchTableViewCell = SearchTableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "mySearchCell")
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "mySearchCell")! as UITableViewCell
//        cell.imageView!.layer.cornerRadius = 20
//        cell.imageView!.clipsToBounds = true
//        cell.textLabel?.text = filteredData[indexPath.row].name
//        cell.imageView?.image = UIImage(named: filteredData[indexPath.row].image)
//        return cell
//    }
//
//    var memberIndex = 0
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        print("You tapped me!")
//        memberIndex = indexPath.row
//        performSegue(withIdentifier: "myProfileSegue", sender: self)
//    }
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//        filteredData = []
//
//        if searchText == "" {
//            filteredData = searchMembers
//        } else {
//            for member in searchMembers {
//                if member.name.lowercased().contains(searchText.lowercased()) {
//                    filteredData.append(member)
//                }
//            }
//        }
//        self.tableView.reloadData()
//    }

class SearchTableViewController: UITableViewController, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!


    
    var searchMembers: [Member] = []
    var filteredData: [Member]! = []

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        filteredData = searchMembers

    }

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 0
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
        let cell: SearchTableViewCell = SearchTableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "mySearchCell")
        
        cell.imageView!.layer.cornerRadius = 20
        cell.imageView!.clipsToBounds = true
        cell.textLabel?.text = filteredData[indexPath.row].name
        cell.imageView?.image = UIImage(named: filteredData[indexPath.row].image)

        return cell
    }
    
    
    var memberIndex = 0
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print("You tapped me!")
        memberIndex = indexPath.row
        performSegue(withIdentifier: "myProfileSegueFromSearchBar", sender: self)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []

        if searchText == "" {
            filteredData = searchMembers
        } else {
            for member in searchMembers {
                if member.name.lowercased().contains(searchText.lowercased()) {
                    filteredData.append(member)
                }
            }
        }
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "myProfileSegueFromSearchBar") {
            let receiverVC = segue.destination as! MyProfileViewController
            
            receiverVC.myName = searchMembers[memberIndex].name
            receiverVC.myImage = UIImage(named: searchMembers[memberIndex].image)
            receiverVC.myContact = searchMembers[memberIndex].contact
            receiverVC.myEmail = searchMembers[memberIndex].email
            receiverVC.myProfileMessage = searchMembers[memberIndex].profileMessage
            
        }
        
    }
    
    
    
    
    
}

