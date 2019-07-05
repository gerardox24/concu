//
//  SettingsViewController.swift
//  iCatchUp
//
//  Created by Developer on 10/19/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var showOnBoardingSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showOnBoardingSwitch.setOn(SettingsStore.shared.shouldShowOnboarding, animated: true)
       
    }

    @IBAction func showOnboardingValueChanged(_ sender: UISwitch) {
        SettingsStore.shared.shouldShowOnboarding = sender.isOn
    }
}
