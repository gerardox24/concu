//
//  ArticleCell.swift
//  iCatchUp
//
//  Created by Developer on 10/26/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import UIKit

class ArticleCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pictureImageView: UIImageView!
    var article: Article?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func update(from article: Article) {
        self.article = article
        if let urlString = article.urlToImage {
            self.pictureImageView.setImage(
                fromUrlString: urlString,
                withDefaultImage: "no-image-available",
                withErrorImage: "no-image-available")
        }
        self.titleLabel.text = article.title
    }
}
