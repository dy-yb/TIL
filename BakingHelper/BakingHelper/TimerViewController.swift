//
//  TimerViewController.swift
//  BakingHelper
//
//  Created by Daye on 2021/04/27.
//

import UIKit

class TimerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Timer"
        // Do any additional setup after loading the view.
    }
    
    
    func setView(){
        
        let time = UILabel()
        let startBtn = UIButton()
        let pauseBtn = UIButton()
        let resetBtn = UIButton()
        
        
        time.translatesAutoresizingMaskIntoConstraints = false
        //time.topAnchor.constraint(equalTo: self.topAnchor, constant: 200).isActive = true
        
        startBtn.translatesAutoresizingMaskIntoConstraints = false
        pauseBtn.translatesAutoresizingMaskIntoConstraints = false
        resetBtn.translatesAutoresizingMaskIntoConstraints = false
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
