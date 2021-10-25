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
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        profileImageView.image = myImage
        profileNameLabel.text = myName
        profileEmailLabel.text = myEmail
        profileContactLabel.text = myContact
        profileMessageLabel.text = myProfileMessage
        print("검사")
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


