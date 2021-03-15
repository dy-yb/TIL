//
//  BountyViewController.swift
//  BountyList
//
//  Created by Daye on 2021/02/28.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MVVM
    
    // Model1
    // - BountyInfo(생성필요)
    
    // View
    // - ListCell(table view)
    
    // ViewModel
    // - BountyViewModel(BountyInfo에서 데이터를 받아서 ListCell에 전달, model을 가지고있음)
    
//    let bountyInfoList: [BountyInfo] = [
//        BountyInfo(name: "brook", bounty: 3300000),
//        BountyInfo(name: "chopper", bounty: 50),
//        BountyInfo(name: "franky", bounty: 4400000),
//        BountyInfo(name: "luffy", bounty: 30000000),
//        BountyInfo(name: "nami", bounty: 16000000),
//        BountyInfo(name: "robin", bounty: 8000000000),
//        BountyInfo(name: "sanji", bounty: 7770000000),
//        BountyInfo(name: "zoro", bounty: 1200000000)
//    ]
    
    let viewModel = BountyViewModel()
    
//    let nameList = ["brook","chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro" ]
//    let bountyList = [33000000, 50, 44000000, 30000000, 16000000, 8000000000, 777000000, 1200000000]

    //segue가 실행되기 직전에 준비하는 함수, DetailViewController에 데이터 넘겨줄 것.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            let vc = segue.destination as? DetailViewController
                
            
            if let index = sender as? Int{
                
                let bountyInfo = viewModel.bountyInfo(at: index)
                vc?.bountyInfo = bountyInfo
//                vc?.name = bountyInfo.name
//                vc?.bounty = bountyInfo.bounty
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numOfBountyInfoList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        
        let bountyInfo = viewModel.bountyInfo(at: indexPath.row)
        cell.imgView.image = bountyInfo.image
        cell.nameLabel.text = bountyInfo.name
        cell.bountyLabel.text = "\(bountyInfo.bounty)"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
}

struct BountyInfo {
    let name: String
    let bounty: Int
    
    var image: UIImage?{
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int){
        self.name = name
        self.bounty = bounty
    }
}

class BountyViewModel {
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 3300000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 4400000),
        BountyInfo(name: "luffy", bounty: 30000000),
        BountyInfo(name: "nami", bounty: 16000000),
        BountyInfo(name: "robin", bounty: 8000000000),
        BountyInfo(name: "sanji", bounty: 7770000000),
        BountyInfo(name: "zoro", bounty: 1200000000)
    ]
    
    var numOfBountyInfoList: Int{
        return bountyInfoList.count
    }

    func bountyInfo(at index: Int)-> BountyInfo{
        return bountyInfoList[index]
    }
}
