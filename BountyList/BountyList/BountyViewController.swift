//
//  BountyViewController.swift
//  BountyList
//
//  Created by Daye on 2021/02/21.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
    
    let bountyList = [33000000, 50, 4400000, 300000000, 1600000, 80000000, 7700000, 120000000]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //다시 봐야 할 부분***
//
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ListCell else{
//            return UITableViewCell()
//        }
//        return cell
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ListCell {
            let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
            cell.imgView.image = img
            cell.nameLabel.text = nameList[indexPath.row]
            cell.bountyLabel.text = "\(bountyList[indexPath.row])"
            
            return cell
            
        } else {
            return UITableViewCell()
        }
        
    }

    //UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath)!")
    }
    
}


    class ListCell: UITableViewCell {
        @IBOutlet weak var imgView: UIImageView!
        @IBOutlet weak var nameLabel: UILabel!
        @IBOutlet weak var bountyLabel: UILabel!
        
}

