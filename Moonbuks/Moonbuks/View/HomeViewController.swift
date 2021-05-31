//
//  ViewController.swift
//  Moonbuks
//
//  Created by Daye on 2021/05/24.
//

import UIKit

class HomeViewController: UITabBarController {

    let moonGreen = UIColor(displayP3Red: 1/255, green: 168/255, blue: 98/255, alpha: 1)
    
    var currentStar = 13
    var maxStar = 30
    var currentStarLabel = UILabel()
    var username = "쫑이"
    
    let sayHelloLabel = UILabel()
    let neededStarLabel = UILabel()
    let maxStarLabel = UILabel()
    let gaugeBar = UIProgressView(progressViewStyle: .bar)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        viewSet()
        layout()
        
        // Do any additional setup after loading the view.
    }

    func addViews(){
        
        view.addSubview(gaugeBar)
        view.addSubview(currentStarLabel)
        view.addSubview(neededStarLabel)
        view.addSubview(maxStarLabel)
        view.addSubview(sayHelloLabel)
        
    }
    
    func viewSet(){
        
        currentStarLabel.text = "\(currentStar)"
        maxStarLabel.text = " / \(maxStar)★"
        neededStarLabel.text = "\(30 - currentStar)★ until Gold Level"
        
        gaugeBar.setProgress(1.0, animated: false)
        gaugeBar.progress = Float(currentStar) / Float(maxStar)
        
        gaugeBar.layer.cornerRadius = 2.5
        gaugeBar.clipsToBounds = true
        
        gaugeBar.trackTintColor = UIColor(displayP3Red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        gaugeBar.tintColor = moonGreen
        
        currentStarLabel.textColor = .black
        neededStarLabel.textColor = moonGreen
        maxStarLabel.textColor = moonGreen

        sayHelloLabel.text = "초록초록 \n여름이 시작됐어요🍃"
        sayHelloLabel.font = UIFont(name: "AppleSDGothicNeo-SemiBold" , size: 25)
        neededStarLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        maxStarLabel.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 28)
        currentStarLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 40)
 
        
    }
    
    
    func layout(){
        
        //MARK: gaugeBar
      
        gaugeBar.translatesAutoresizingMaskIntoConstraints = false
        gaugeBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 140).isActive = true
        gaugeBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        gaugeBar.widthAnchor.constraint(equalToConstant: 240).isActive = true
        gaugeBar.heightAnchor.constraint(equalToConstant: 5).isActive = true
        
        //MARK: Labels
          
        sayHelloLabel.translatesAutoresizingMaskIntoConstraints = false
        sayHelloLabel.lineBreakStrategy = .hangulWordPriority
        sayHelloLabel.lineBreakMode = .byWordWrapping
        sayHelloLabel.numberOfLines = 2
        
        sayHelloLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        sayHelloLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        sayHelloLabel.widthAnchor.constraint(equalToConstant: 240).isActive = true
        sayHelloLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        neededStarLabel.translatesAutoresizingMaskIntoConstraints = false
        neededStarLabel.bottomAnchor.constraint(equalTo: gaugeBar.topAnchor, constant: -10).isActive = true
        neededStarLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
        currentStarLabel.translatesAutoresizingMaskIntoConstraints = false
        currentStarLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 110).isActive = true
        currentStarLabel.leadingAnchor.constraint(equalTo: gaugeBar.leadingAnchor, constant: 250).isActive = true

        maxStarLabel.translatesAutoresizingMaskIntoConstraints = false
        maxStarLabel.leadingAnchor.constraint(equalTo: currentStarLabel.leadingAnchor, constant: 40).isActive = true
        maxStarLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120).isActive = true
        
        
        
        
    }
}


