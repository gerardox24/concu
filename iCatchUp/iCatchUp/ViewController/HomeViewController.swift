//
//  HomeViewController.swift
//  iCatchUp
//
//  Created by Developer on 10/26/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit
import os
private let reuseIdentifier = "Cell"

class HomeViewController: ArticlesViewController {
    override func viewDidLoad() {
        if SettingsStore.shared.shouldShowOnboarding {
            self.performSegue(withIdentifier: "showOnboarding", sender: nil)
            super.viewDidLoad()
        }
        
    }
}
