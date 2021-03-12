//
//  GeneratedViewController.swift
//  PSWGenerator
//
//  Created by Christian Coduri on 09/03/21.
//

import UIKit

class GeneratedViewController: UIViewController {

    @IBOutlet weak var pswLabel: UILabel!
    
    var pswGenerated: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pswLabel.text = pswGenerated                        // Setto nella label la password generata da MainViewController
    }
    
    @IBAction func copiaPassword(_ sender: UIButton) {
        UIPasteboard.general.string = pswLabel.text         // Copio la password
        sender.setTitle("Copiata", for: .normal)            // Cambio scritta
        sender.alpha = 0.5                                  // Abbasso opacità
        sender.isEnabled = false                            // Disabilito bottone
    }
    
    @IBAction func tornaIndietro(_ sender: UIButton) {
        self.dismiss(animated: true)                        // Chiudo questa finestra => Torno alla MainView
    }
    
}
