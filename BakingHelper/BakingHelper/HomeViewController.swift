//
//  ViewController.swift
//  BakingHelper
//
//  Created by Daye on 2021/04/26.
//

import UIKit

class HomeViewController: UITableViewController {

    let cellID = "cellID"
    let header: [String] = ["Menu", "Info"]
    let menu: [[String]] = [["Calculator", "Recipes", "Timer"],["App Info"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Baking Time!"
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menu[section].count
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return menu.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
        cell.textLabel?.text = menu[indexPath.section][indexPath.row]
        //cell.detailTextLabel?.text = subtitle[indexPath.section]
       
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return header[section]
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let infoViewController = InfoViewController()
        let calculatorViewController = CalculatorViewController()
        let recipesViewController = RecipesViewController()
        let timerViewController = TimerViewController()
        
        tableView.deselectRow(at: indexPath, animated: true)
        switch menu[indexPath.section][indexPath.row] {
        case "Calculator":
            self.navigationController?.pushViewController(calculatorViewController, animated: true)
        case "Recipes":
            self.navigationController?.pushViewController(recipesViewController, animated: true)
        case "Timer":
            self.navigationController?.pushViewController(timerViewController, animated: true)
        case "App Info":
            self.navigationController?.pushViewController(infoViewController, animated: true)
        default:
            return
        }
    }

    
}




