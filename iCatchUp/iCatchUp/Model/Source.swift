//
//  Source.swift
//  iCatchUp
//
//  Created by Developer on 10/19/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation

struct Source: Codable {
    var id: String?
    var name: String?
    var description: String?
    var url: String?
    var category: String?
    var language: String?
    var country: String?
    
    var urlToLogo: String {
        return LogoApi.urlToLogo(fromSource: self)
    }
    
    var isFavorite: Bool {
        get {
            return CatchUpStore.shared.isFavorite(source: self)
        }
        set {
            CatchUpStore.shared.setFavorite(newValue, for: self)
        }
    }
}

