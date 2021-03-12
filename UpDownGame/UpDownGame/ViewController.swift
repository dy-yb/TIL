//
//  ViewController.swift
//  UpDownGame
//
//  Created by Daye on 2021/03/01.
//

import UIKit

class ViewController: UIViewController {

    var randomValue: Int = 0
    var tryCount: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    @IBOutlet weak var tryCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        reset()
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
    }

    func reset(){
        print("reset!")
        randomValue = Int(arc4random_uniform(30))
       // print(randomValue)
        tryCount = 0
        tryCountLabel.text = "0 / 5"
        sliderValueLabel.text = "15"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "0"
        
    }


    
    @IBAction func sliderValueChanged(_ sender: UISlider){
        sliderValueLabel.text = String(Int(sender.value))
        
    }

    @IBAction func touchUpHitButton(_ sender: UIButton){
        print(slider.value)
        
        if String(randomValue) == sliderValueLabel.text {
            
            let alert = UIAlertController(title: "Alert message", message: "Successed!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Confirm", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
            reset()
            
        } else {
        
        if tryCount>=5 {
            let message = "기회를 모두 소진하였습니다."
            let alert = UIAlertController(title:  "Alert message", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Confirm", style: .default, handler: nil)
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
            reset()
            
        } else {
            tryCount = tryCount+1
            tryCountLabel.text = "\(tryCount) / 5"
        }
        }
    }
    

    @IBAction func touchUpResetButton(_ sender: UIButton){
        
        let message = "게임이 초기화 됩니다."
        let alert = UIAlertController(title:  "Alert message", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Confirm", style: .default, handler: nil)
        

        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        reset()
      //  print("touch up reset button")
    }
}

