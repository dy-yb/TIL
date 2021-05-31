//
//  TabsViewController.swift
//  Moonbuks
//
//  Created by Daye on 2021/05/31.
//

import UIKit

class TabsViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = UIColor(displayP3Red: 1/255, green: 168/255, blue: 98/255, alpha: 1)
        
        setupVCs()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
          
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        
        rootViewController.navigationItem.title = title
        
        return navController
      }

    func setupVCs() {
          viewControllers = [
            createNavController(for: HomeViewController(), title: NSLocalizedString("Home", comment: ""), image: UIImage(named: "home.svg")!),
            createNavController(for: OrderViewController(), title: NSLocalizedString("Order", comment: ""), image: UIImage(named: "order.svg")!),
            createNavController(for: PayViewController(), title: NSLocalizedString("Pay", comment: ""), image: UIImage(named: "pay.svg")!),
            createNavController(for: GiftViewController(), title: NSLocalizedString("Gift", comment: ""), image: UIImage(named: "gift.svg")!),
            createNavController(for: OtherViewController(), title: NSLocalizedString("Other", comment: ""), image: UIImage(named: "other.svg")!)
          ]
      }

}
