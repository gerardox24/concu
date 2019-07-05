//
//  FavoritesViewController.swift
//  iCatchUp
//
//  Created by Developer on 11/9/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import UIKit
import os

class FavoritesViewController: ArticlesViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isRestrictedToFavorites = true
    }
}

