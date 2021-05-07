//
//  RecipesViewController.swift
//  BakingHelper
//
//  Created by Daye on 2021/04/27.
//

import UIKit

class RecipesViewController: UITableViewController {

    @objc
    func addRecipe(){
        let addRecipeViewController = AddRecipeViewController()
        self.navigationController?.pushViewController(addRecipeViewController, animated: true)
    }
    
    var recipes: [Recipes] = [Recipes(title: "Sample", creationDate: Date())]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "My Recipes"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(addRecipe))
    }
    
    func formatDate(date: Date, format: String) -> String{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = format
            let formattedDate = dateFormatter.string(from: date)
            return formattedDate
        }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cellID")
        cell.textLabel?.text = recipes[indexPath.row].title
        cell.detailTextLabel?.text = formatDate(date: Date(), format: "YYYY-MM-dd")
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }

}

//class RecipeCell : UITableViewCell {
//
//    static let cellID = "cellID"
//
//    let recipeTitle = UILabel()
//    let creationDate = UILabel()
//
//    func layout(){
//
//        self.addSubview(recipeTitle)
//        self.addSubview(creationDate)
//
//
//        recipeTitle.translatesAutoresizingMaskIntoConstraints = false
//        recipeTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
//        recipeTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//
//    }
//
//}
