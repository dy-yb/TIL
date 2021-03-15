//
//  DetailViewController.swift
//  BountyList
//
//  Created by Daye on 2021/03/01.
//

import UIKit

class DetailViewController: UIViewController {

    // MVVM
    
    // Model1
    // - BountyInfo(생성필요)
    
    // View
    // - imgView, nameLabel, bountyLabel
    
    // ViewModel
    // - DetailViewModel
    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
//    var name: String?
//    var bounty: Int?
    
    var bountyInfo: BountyInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        if let bountyInfo = self.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)" 
        }
//
//        if let name = self.name, let bounty = self.name{
//            let img = UIImage(named: "\(name).jpg")
//            imgView.image = img
//            nameLabel.text = name
//            bountyLabel.text = "\(bounty)"
//        }
    }

    //해당 컨트롤러가 사라지게 하는 함수
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
