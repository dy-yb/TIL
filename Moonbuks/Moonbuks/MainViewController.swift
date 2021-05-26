//
//  ViewController.swift
//  Moonbuks
//
//  Created by Daye on 2021/05/24.
//

import UIKit

class MainViewController: UITabBarController {

    let helloMessage = UILabel()
    let starStatus = UILabel()
    let gaugeBar = UIProgressView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
           UITabBar.appearance().barTintColor = .systemBackground
           tabBar.tintColor = .label
           setupVCs()
        
        layout()
        
        // Do any additional setup after loading the view.
    }

    fileprivate func createNavController(for rootViewController: UIViewController,
                                                    title: String,
                                                    image: UIImage) -> UIViewController {
          let navController = UINavigationController(rootViewController: rootViewController)
          navController.tabBarItem.title = title
          navController.tabBarItem.image = image
          navController.navigationBar.prefersLargeTitles = true
          rootViewController.navigationItem.title = title
          return navController
      }

    func setupVCs() {
          viewControllers = [
            createNavController(for: ViewController(), title: NSLocalizedString("Home", comment: ""), image: UIImage(named: "home.svg")!),
            createNavController(for: ViewController(), title: NSLocalizedString("Order", comment: ""), image: UIImage(named: "order.svg")!),
            createNavController(for: ViewController(), title: NSLocalizedString("Pay", comment: ""), image: UIImage(named: "pay.svg")!),
            createNavController(for: ViewController(), title: NSLocalizedString("Gift", comment: ""), image: UIImage(named: "gift.svg")!),
            createNavController(for: ViewController(), title: NSLocalizedString("Other", comment: ""), image: UIImage(named: "other.svg")!)
          ]
      }
    
    
    func layout(){
        
    }
}


