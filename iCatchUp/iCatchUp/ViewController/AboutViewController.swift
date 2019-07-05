//
//  AboutViewController.swift
//  iCatchUp
//
//  Created by Developer on 11/9/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBAction func startAction(_ sender: UIButton) {
      // Update Onboarding Showing status
      SettingsStore.shared.didShowOnboarding = true
      
      // Go to Main Storyboard
      let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
      let controller = storyboard.instantiateInitialViewController()
      self.present(controller!, animated: false)
    }
    
}
