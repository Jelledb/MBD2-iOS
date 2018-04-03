//
//  ColorUIViewController.swift
//  Eindopdracht-MBD2
//
//  Created by Jelle den Burger on 03-04-18.
//  Copyright © 2018 Jelle den Burger. All rights reserved.
//

import UIKit

class ColorUIViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        
        let defaults = UserDefaults.standard
        let color = defaults.string(forKey: "BackgroundColor")!
        
        let uiColor: UIColor;
        
        switch (color) {
        case "Red":
            uiColor = UIColor.red
        case "Blue":
            uiColor = UIColor.blue
        case "Green":
            uiColor = UIColor.green
        case "Yellow":
            uiColor = UIColor.yellow
        default:
            uiColor = UIColor.white
        }
        self.view.backgroundColor = uiColor;
    }
}
