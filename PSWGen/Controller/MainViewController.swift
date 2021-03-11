//
//  ViewController.swift
//  PSWGenerator
//
//  Created by Christian Coduri on 27/02/21.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    
    //Siwtch Button
    @IBOutlet weak var minuscoleSwitch: UISwitch!
    @IBOutlet weak var maiuscoleSwitch: UISwitch!
    @IBOutlet weak var numeriSwitch: UISwitch!
    @IBOutlet weak var specialiSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Valori predefiniti
        sliderLabel.text = "16"
        slider.value = 16
    }

    // Cambio il valore numerico della Label
    @IBAction func changeSliderLabel(_ sender: UISlider) {
        sliderLabel.text = String(format: "%02d", Int(sender.value))
    }
    
    // Metodo chiamato dopo aver effettuato l'azione di on/off di qualsiasi UISwitch
    @IBAction func checkSwitches(_ sender: UISwitch) {
        if sender.isOn == false{
            // Sto spegnendo uno UISwitch => Controllo che almeno uno sia ON
            if !minuscoleSwitch.isOn && !maiuscoleSwitch.isOn && !numeriSwitch.isOn && !specialiSwitch.isOn {
                // Tutti disattivi, rimetto l'ultimo su ON
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
            
            destinationVC.pswGenerated = Password().generaPassword(
                    numeroChar: Int(slider.value), minuscole: minuscoleSwitch.isOn, maiuscole: maiuscoleSwitch.isOn,
                    numeri: numeriSwitch.isOn, speciali: specialiSwitch.isOn
            )
        }
    }
    
}

