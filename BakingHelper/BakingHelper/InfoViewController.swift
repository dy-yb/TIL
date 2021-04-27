//
//  InfoViewController.swift
//  BakingHelper
//
//  Created by Daye on 2021/04/26.
//

import UIKit

class InfoViewController: UITableViewController {

    let headers: [String] = ["App Version", "Developer", "Git"]
    let infos: [String] = ["0.0", "Daye Yoon", "dy-yb"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "App Info"
        tableView.register(InfoCell.self, forCellReuseIdentifier: InfoCell.cellID)
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InfoCell.cellID, for: indexPath) as! InfoCell
        
        cell.headerLabel.text = headers[indexPath.row]
        cell.infosLabel.text = infos[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headers.count
    }
    

}

class InfoCell: UITableViewCell {
    
    static let cellID = "cellID"

    let headerLabel = UILabel()
    let infosLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout(){
        
        self.addSubview(headerLabel)
        self.addSubview(infosLabel)
        
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        headerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        infosLabel.translatesAutoresizingMaskIntoConstraints = false
        infosLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        infosLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        infosLabel.textColor = .gray

    }
//
}
