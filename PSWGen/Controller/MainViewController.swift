//
//  ViewController.swift
//  PSWGen
//
//  Created by Christian Coduri on 27/02/21.
//

import UIKit

class MainViewController: UIViewController {

    let minuscole = Array("abcdefghijklmnopqrstuvwxyz")
    let maiuscole = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    let numeri = Array("1234567890")
    let speciali = Array("~`!@#$%^&*()-_+={}[]|\\/:;\"'<>,.?")
    
    var psw = ""
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    
    //Siwtch Button
    @IBOutlet weak var minuscoleSwitch: UISwitch!
    @IBOutlet weak var maiuscoleSwitch: UISwitch!
    @IBOutlet weak var numeriSwitch: UISwitch!
    @IBOutlet weak var specialiSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderLabel.text = "16"
        slider.value = 16
    }

    // Cambio il valore della label 
    @IBAction func changeSliderLabel(_ sender: UISlider) {
        sliderLabel.text = String(format: "%02d", Int(sender.value))
    }
    
    @IBAction func checkSwitches(_ sender: UISwitch) {
        // Metodo chiamato dopo aver effettuato l'azione di on/off
        if sender.isOn == false{
            //Controllo che almeno uno degli altri sia on
            
            if !minuscoleSwitch.isOn && !maiuscoleSwitch.isOn && !numeriSwitch.isOn && !specialiSwitch.isOn {
                sender.setOn(true, animated: true)
            }
        }
        
    }
    
    @IBAction func generatePassword(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResult"){
            let destinationVC = segue.destination as! GeneratedViewController
            
            //genero password
            var array: [Character] = []
            var psw: String = ""
            
            let numeroChar = Int(slider.value)
            
            if(minuscoleSwitch.isOn){
                array.append(contentsOf: minuscole)
            }
            if(maiuscoleSwitch.isOn){
                array.append(contentsOf: maiuscole)
            }
            if(numeriSwitch.isOn){
                array.append(contentsOf: numeri)
            }
            if(specialiSwitch.isOn){
                array.append(contentsOf: speciali)
            }
            
            for _ in 1...numeroChar {
                psw += String(array.randomElement()!)
            }
            destinationVC.pswGenerated = psw
        }
    }
    
}

