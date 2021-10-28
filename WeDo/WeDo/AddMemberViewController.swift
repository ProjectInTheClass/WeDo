//
//  AddMemberViewController.swift
//  WeDo
//
//  Created by 최형민 on 2021/10/26.
//

import UIKit

class AddMemberViewController: UIViewController, UISearchBarDelegate{
    
    @IBOutlet weak var addMember: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myName: UILabel!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var members: [Member] = [
        Member(name: "김토니", image: "dog", email: "vkennerley0@howstuffworks.com", contact: "010-1234-5678", profileMessage: "안녕하세요"),
        Member(name: "김춘삼", image: "cat", email: "rhanratty1@sina.com", contact: "010-4543-4343", profileMessage: "안녕하세요2"),
        Member(name: "김춘식", image: "raccoon", email: "kbeere2@wp.com", contact: "010-3322-3322", profileMessage: "안냥"),
        Member(name: "박삼식", image: "goat", email: "jshoppee3@blogspot.com", contact: "010-3303-3303", profileMessage: "안녕하세요3"),
        Member(name: "조덕배", image: "panda", email: "cgreenside5@apple.com", contact: "010-2182-3822", profileMessage: "안녕하셍ㄷ"),
        Member(name: "이수지", image: "tiger", email: "agladtbach6@dagondesign.com", contact: "010-9665-5945", profileMessage: "ㄴ엉"),
        Member(name: "현계림", image: "zebra", email: "agoudy11@examiner.com", contact: "010-3943-5885", profileMessage: "ㄴ어")
    ]
    
    var searchedMember: [Member]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchBar.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedMember = []
            
        for word in members {
            if word.email.lowercased().elementsEqual(searchText.lowercased()) {
                searchedMember.append(word)
                myImage.image = UIImage(named: word.image)
                myName.text = word.name
            }
        }
        self.myImage.reloadInputViews()
        self.myName.reloadInputViews()
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
