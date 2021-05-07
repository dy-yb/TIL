//
//  AddRecipeViewController.swift
//  BakingHelper
//
//  Created by Daye on 2021/05/05.
//

import UIKit

class AddRecipeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //self.recipeTextView.delegate = self
        navigationItem.title = "Add your own recipe!"
        // Do any additional setup after loading the view.
    }
    
    private lazy var recipeTextView : UITextView = {
        let recipeTextView: UITextView = UITextView()
        
        return recipeTextView
    }()



}

struct Recipes {
    
    var title : String?
    var creationDate : Date?
    var contents : String?
    
}
