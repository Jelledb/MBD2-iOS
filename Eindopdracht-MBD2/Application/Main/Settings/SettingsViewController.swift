//
//  SettingsViewController.swift
//  Eindopdracht-MBD2
//
//  Created by Jelle den Burger on 03-04-18.
//  Copyright © 2018 Jelle den Burger. All rights reserved.
//

import UIKit

class SettingsViewController: ColorUIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Settings";
    }
    
    @IBAction func onSelectSegment(_ sender: UISegmentedControl) {
        let color = sender.titleForSegment(at: sender.selectedSegmentIndex)!
        let defaults = UserDefaults.standard;
        
        defaults.set(color, forKey: "BackgroundColor")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
