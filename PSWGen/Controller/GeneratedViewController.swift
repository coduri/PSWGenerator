//
//  GeneratedViewController.swift
//  PSWGen
//
//  Created by Christian Coduri on 09/03/21.
//

import UIKit

class GeneratedViewController: UIViewController {

    var pswGenerated = ""
    @IBOutlet weak var pswLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pswLabel.text = pswGenerated
    }
    
    @IBAction func copiaPassword(_ sender: UIButton) {
        UIPasteboard.general.string = pswLabel.text
        sender.alpha = 0.5
        sender.isEnabled = false
    }
    
    @IBAction func tornaIndietro(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
