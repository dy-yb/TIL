//
//  ViewController.swift
//  UpDownGame
//
//  Created by Daye on 2021/03/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
    }

    @IBAction func sliderValueChanged(_ sender: UISlider){
        print(sender.value)
        
    }

    @IBAction func touchUpHitButton(_ sender: UIButton){
        print(slider.value)
    }

    @IBAction func touchUpResetButton(_ sender: UIButton){
        
        let message = "touch up reset button"
        let alert = UIAlertController(title:  "Alert message", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        print("touch up reset button")
    }
}

