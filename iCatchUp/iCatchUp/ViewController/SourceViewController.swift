//
//  SourceViewController.swift
//  iCatchUp
//
//  Created by Developer on 11/2/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class SourceViewController: UIViewController {
    var source: Source?
    var isFavorite = false
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if  let source = source,
            let logoImageView = logoImageView,
            let nameLabel = nameLabel,
            let descriptionLabel = descriptionLabel,
            let favoriteButton = favoriteButton {
            logoImageView.setImage(fromUrlString: source.urlToLogo, withDefaultImage: "no-image-avaliable", withErrorImage: "no-image-avaliable")
            nameLabel.text = source.name
            descriptionLabel.text = source.description
            isFavorite = source.isFavorite
            updateImage(for: favoriteButton)
            
        }
    }
    
    @IBAction func favoriteAction(_ sender: UIButton) {
        toggleFavorite(button: sender)
    }
    
    func toggleFavorite(button: UIButton) {
        if source != nil {
            isFavorite = !isFavorite
            self.source!.isFavorite = isFavorite
            updateImage(for: button)
        }
    }
    
    
    func updateImage(for button: UIButton) {
        let name = isFavorite ?
            "favorite-icon-black" : "favorite-icon-border-black"
        button.imageView?.setImage(fromAsset: name)
    }
    
}
