//
//  SettingsViewController.swift
//  Pensamentos
//
//  Created by Israel3D on 17/06/2018.
//  Copyright © 2018 Israel3D. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {


    @IBOutlet weak var swAutoRefresh: UISwitch!
    @IBOutlet weak var lblTimeInterval: UILabel!
    @IBOutlet weak var slTimeInterval: UISlider!
    @IBOutlet weak var scColorScheme: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func changeAutoRefresh(_ sender: UISwitch) {
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
    }
    
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
    }
    


}
