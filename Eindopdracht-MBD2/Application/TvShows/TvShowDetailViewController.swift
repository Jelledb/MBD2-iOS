//
//  TvShowDetailViewController.swift
//  Eindopdracht-MBD2
//
//  Created by Jelle den Burger on 29-03-18.
//  Copyright © 2018 Jelle den Burger. All rights reserved.
//

import UIKit

class TvShowDetailViewController: UIViewController {
    var tvShow: TvShow?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Swift.print(tvShow);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
