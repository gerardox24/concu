//
//  SettingsStore.swift
//  iCatchUp
//
//  Created by Developer on 11/9/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

class SettingsStore {
    
    static let shared = SettingsStore()
    
    private init() {
        
    }
    
    var didShowOnboarding: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "didShowOnboarding")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "didShowOnboarding")
        }
    }
    
    var shouldShowOnboarding: Bool {
        get {
            return !didShowOnboarding
        }
        set {
            didShowOnboarding = !newValue
        }
    }
}
