//
//  ArticleViewController.swift
//  iCatchUp
//
//  Created by Developer on 10/30/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {

    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    var article: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if  let article = article,
            let urlToImage = article.urlToImage,
            let pictureImageView = pictureImageView,
            let titleLabel = titleLabel,
            let descriptionLabel = descriptionLabel,
            let contentLabel = contentLabel {
                pictureImageView.setImage(
                    fromUrlString: urlToImage,
                    withDefaultImage: "no-image-available",
                    withErrorImage: "no-image-available")
                titleLabel.text = article.title
                descriptionLabel.text = article.description
                contentLabel.text = article.content
        }
    }
}
